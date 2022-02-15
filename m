Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D365D1578
	for <regressions@lists.linux.dev>; Tue, 15 Feb 2022 16:22:09 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id x4so13474209plb.4
        for <regressions@lists.linux.dev>; Tue, 15 Feb 2022 08:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aL1Ai2InGicb7ahZQpdv5e9x/ONiZjtIAS2dF1D0S2o=;
        b=vNb54qajFSiKeRJfRAser6tmq4YROi3TaW6ql4v5+lZ8250zTZTJH1ttBk7phLtJE/
         8X1xJ+aPM3gWHECS563y21SvX9Rb3Whn9VDu4xQqfZimFge8tVLTHWpcjfudVT/+xSBt
         8IJLGbV1EzmvVRGWG1e5Loyjws1+uPfMdm116IGe1i+zsMKsxVCWtIalTFgUB7oct0lF
         MuOPY3rMbsSUfKYcxS+iakLKgNb9dwlSZ87PA4NY2RqCylJGKpnIAotIGx0GuS7VLpnJ
         JQm0c9L6L1JUKc9600lOKO4VcrpWaIkoCrIbss4X4+YQQR/UpMGs55jhnNOVQDUDnF39
         YY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aL1Ai2InGicb7ahZQpdv5e9x/ONiZjtIAS2dF1D0S2o=;
        b=xlYUq7lMUMW2XZl0ykFOE8cwl8pLKBGmNDgbvNvr4PS/dWFwX3wIY+CHl125T2DxLH
         uQhcqMXaSVivmY1ZOFMpeRUwEN4+fLkwDXLXGoE9c6myN/ZbZcJ0r0RwBttyyBXqYdYN
         2EkTh3HbBuq93gl6kSv9R0aLT2bjNgA6FyMTN7McEz9xueiwWQanQExhptL9YDuIu/8t
         Ssjyx7gXReE4Ty9TO2XZDFWdrXBobyXhasksSGqCwNd7OPp9xzqHX15+OBhdE/58kkvh
         q8tTne6QW4t7e/WPvZgSk+roGbVpyAf+xPQyriCFtZSPLCpbNubh9+XfYaQwV1Yhqylq
         2Dbg==
X-Gm-Message-State: AOAM531SJTyJgIUmHp15pIZOcwJp1x+qdHRvY/p6Wg+AWFjmgQ10Reuw
	/Ld/Ajza1pgLvUHKBV8B+rN1qhFjF6XFX2ryiCtRZA==
X-Google-Smtp-Source: ABdhPJycTIiQcI++KSnaRXdKC1+/Za2TF78mUkZ2Pq3jl1G9S9TZeJkyWRyx3RI9dH9/htg5W9HUadriJMCICjLWGTY=
X-Received: by 2002:a17:902:ce12:: with SMTP id k18mr4872669plg.34.1644942129125;
 Tue, 15 Feb 2022 08:22:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <55f5c077-061c-7e53-b02d-53dde1dd654f@molgen.mpg.de>
In-Reply-To: <55f5c077-061c-7e53-b02d-53dde1dd654f@molgen.mpg.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 15 Feb 2022 08:22:02 -0800
Message-ID: <CAPcyv4jSP4PTehMdkcpZfpDcz1HZ0ekjx+WztOiqpwGFU-1iBg@mail.gmail.com>
Subject: Re: New warning: ACPI: CEDT not present
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Linux ACPI <linux-acpi@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 14, 2022 at 11:52 PM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> #regzbot introduced: 2d03e46a4bad20191d07b83ec1242d5f002577be
>
> Dear Dan,
>
>
> On the Dell Latitude E7250, Linux 5.17-rc3 logs the warning below
> (`dmesg --level=warn`):
>
>      ACPI: CEDT not present
>
> I think commit 2d03e46a4bad (ACPI: Add a context argument for table
> parsing handlers), part of Linux since 5.17-rc1, is the reason.
>
> If I understand it correctly, CEDT is not to be expected on older
> devices, so the warning is not justified. Can something be done about it?

Rafael,

I'm inclined to just delete the warning altogether, but special casing
is also an option. Any preference?

diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
index 0741a4933f62..fb2e4a216154 100644
--- a/drivers/acpi/tables.c
+++ b/drivers/acpi/tables.c
@@ -399,7 +399,7 @@ int __init_or_acpilib acpi_table_parse_entries_array(
                instance = acpi_apic_instance;

        acpi_get_table(id, instance, &table_header);
-       if (!table_header) {
+       if (!table_header && strcmp(id, ACPI_SIG_CEDT) != 0) {
                pr_warn("%4.4s not present\n", id);
                return -ENODEV;
        }
