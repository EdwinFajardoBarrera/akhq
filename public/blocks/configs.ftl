<#-- @ftlvariable name="configs" type="java.util.ArrayList<org.kafkahq.models.Config>" -->
<form enctype="multipart/form-data" method="post" class="khq-form">
    <div class="table-responsive">
        <table class="table table-bordered table-striped table-hover mb-0">
            <thead class="thead-dark">
                <tr>
                    <th>Name</th>
                    <th>Value</th>
                    <th>Default</th>
                </tr>
            </thead>
            <tbody>
            <#list configs as config>
                <tr>
                    <td>
                        <code>${config.getName()}</code>
                        <#if config.getDescription()?? >
                        <a class="text-secondary" data-toggle="tooltip" title="${config.getDescription()?replace('<[^>]+>','','r')}">
                            <i class="fa fa-question-circle" aria-hidden="true"></i>
                        </a>
                        </#if>
                    </td>
                    <td>
                        <input type="text"
                            class="form-control"
                            name="configs[${config.getName()}]"
                            value="${config.getValue()!}"
                            ${(config.isReadOnly())?then("readonly", "")}
                        />
                    </td>
                    <td>
                        <span
                            class="badge badge-${(config.getSource().name() == "DEFAULT_CONFIG")?then("secondary", "warning")}"
                        >
                                ${config.getSource().name()}
                        </span>

                        <#if config.isSensitive() >
                            <i class="fa fa-exclamation-triangle text-danger" aria-hidden="true"></i>
                        </#if>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
    <div class="khq-submit">
        <button type="submit" class="btn btn-primary">Update configs</button>
    </div>
</form>