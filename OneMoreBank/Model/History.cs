//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OneMoreBank.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class History
    {
        public int IDOperation { get; set; }
        public string NameOperation { get; set; }
        public System.DateTime DateTime { get; set; }
        public double Amount { get; set; }
        public long Account { get; set; }
    
        public virtual Bank_account Bank_account { get; set; }
    }
}
