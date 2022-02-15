Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C178A158E
	for <regressions@lists.linux.dev>; Tue, 15 Feb 2022 17:11:14 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id j12so35886452ybh.8
        for <regressions@lists.linux.dev>; Tue, 15 Feb 2022 09:11:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SDMnKMXVJa929NolhryiFxFArnbuzBfDe+LVL1CiDA4=;
        b=U6VrQeHv29cl5hV30bQUdJhbbUYJ6AxMhpCjMyzISA/uR0pSMYLa2COTxAhO67azrX
         oq7K2o1FGkle3FLgL1nzGtpfYagMr8zXzD3gvRXMDTFdoSeYyHZYSCfoxP/srCRHxd4m
         M4qqUb9B3UgR24K9uk4hPuB264888tJrZx1ZPxUQwegrGLJ0+3H2lcDeuR48AouoGFML
         sy9ubjiScfHNa5nNPS+58lveewBDzO9Na1QOhyr0EFvN5+jxnz6NUF2Pp9w624Q+2KTq
         1pstedUShx4Qx38dql/NEPqV/8xTEAoxvB0su3N+4mGpbCLbSVXgfsWoKx04VkJ5hoey
         hRlw==
X-Gm-Message-State: AOAM532YXw6f6NKnGIE9FYewg6CEs3F8oklvYpGTOov0lhm8TXZsffi0
	KwCeMsS/cC6k4iB3gaNXBej9tqE92zgl3KE5vhw7RfW7
X-Google-Smtp-Source: ABdhPJwo53vGAohhtNHRmPcc5fLjmAhyMnRIp42CHlVQKf826ePo/bhOG0f9z4hWzUvi1WbJmxqPpIugfXk26cW3QjU=
X-Received: by 2002:a25:3410:: with SMTP id b16mr4716036yba.78.1644945073814;
 Tue, 15 Feb 2022 09:11:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <55f5c077-061c-7e53-b02d-53dde1dd654f@molgen.mpg.de> <CAPcyv4jSP4PTehMdkcpZfpDcz1HZ0ekjx+WztOiqpwGFU-1iBg@mail.gmail.com>
In-Reply-To: <CAPcyv4jSP4PTehMdkcpZfpDcz1HZ0ekjx+WztOiqpwGFU-1iBg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 15 Feb 2022 18:11:02 +0100
Message-ID: <CAJZ5v0hv2P9_g0QAsY_guvYA_vSE-q4jz2902Df7r9KS=iRfMg@mail.gmail.com>
Subject: Re: New warning: ACPI: CEDT not present
To: Dan Williams <dan.j.williams@intel.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Linux ACPI <linux-acpi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 15, 2022 at 5:22 PM Dan Williams <dan.j.williams@intel.com> wrote:
>
> On Mon, Feb 14, 2022 at 11:52 PM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
> >
> > #regzbot introduced: 2d03e46a4bad20191d07b83ec1242d5f002577be
> >
> > Dear Dan,
> >
> >
> > On the Dell Latitude E7250, Linux 5.17-rc3 logs the warning below
> > (`dmesg --level=warn`):
> >
> >      ACPI: CEDT not present
> >
> > I think commit 2d03e46a4bad (ACPI: Add a context argument for table
> > parsing handlers), part of Linux since 5.17-rc1, is the reason.
> >
> > If I understand it correctly, CEDT is not to be expected on older
> > devices, so the warning is not justified. Can something be done about it?
>
> Rafael,
>
> I'm inclined to just delete the warning altogether, but special casing
> is also an option. Any preference?

Change it into pr_debug()?

> diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
> index 0741a4933f62..fb2e4a216154 100644
> --- a/drivers/acpi/tables.c
> +++ b/drivers/acpi/tables.c
> @@ -399,7 +399,7 @@ int __init_or_acpilib acpi_table_parse_entries_array(
>                 instance = acpi_apic_instance;
>
>         acpi_get_table(id, instance, &table_header);
> -       if (!table_header) {
> +       if (!table_header && strcmp(id, ACPI_SIG_CEDT) != 0) {
>                 pr_warn("%4.4s not present\n", id);
>                 return -ENODEV;
>         }
