Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60BB48244
	for <regressions@lists.linux.dev>; Thu,  1 Jun 2023 23:55:14 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b021cddb74so8276545ad.0
        for <regressions@lists.linux.dev>; Thu, 01 Jun 2023 16:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685663714; x=1688255714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ihl8v58xxI+k8/qBpzTYZAfUmx+fnzwWgMHjRzgdYbE=;
        b=kdR5H2X7d12BcILtHvrj70bvW2DgiE0sSf7f2e81MSKM4kNEklP4ZLPEKSqx8t2NvC
         jI93bcl7vbjpdu/IBcQVCB0n/F5b8HzGpfYmAJ1DJyYvApuJ2WQVT61pckYGE2Q9yOXZ
         Cr0BH1XstkTP6Q9izTuWDC8CM5cOb9l/DEFyTyPiPaUOrT1fgk+6OL4/svb1S9ADGqHF
         4+VQBH63V95XUfYJb0fBLJd33YEyL/2NfydYTbjvCxVw95vhrX2RxjO5x9g8Sc/4Kcm2
         RPVAKBUmkGy01BbcCV/V/2UeWrJrHC66XtB/amLVUc40f0uacj5LIj4/nm9rFLIZabGj
         6P4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685663714; x=1688255714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ihl8v58xxI+k8/qBpzTYZAfUmx+fnzwWgMHjRzgdYbE=;
        b=GeD6RIlRoeJYyBNC8lwffbMNgfTylbYo8rRc6VFyNwn+BbbZmCZQp5FYPNWGbCl9Of
         y7xc1W0W+Om7vlQy+MqMA88T29KFTOLxlPnX+IUEVv6zu/P+iKx3vTBZCPITF5OhtMqS
         1LWX8acLKajL/Q/aaOB/idCTwd+L64JOu2ebsNtj49LxmhReVYmJNEHuTFDLjYs9UcyS
         +Y7y2mFVwMXZigboWkSo6s4Dai5FMtuvFJCQDOj+Ww2wgMAYlr7mzZIlI794LRYxk3X/
         93zNA3Vl7L6Sls6P+0QFBDusbiCNOQRYqiMmU0P1pWZ5WGD3dlrj/19a+wNyhcbSg2pc
         +jHQ==
X-Gm-Message-State: AC+VfDz2HvhepHKtwptxE05KS7WZRbFS5lHLT9KmQCHnNpQThJuDyoWA
	ybhBOzWDHerqkaYFsj/nJPU=
X-Google-Smtp-Source: ACHHUZ6BrFhevm2B2jVnR9Sgoop6ktChkiYMnQv1G5hcbie6gxrt0IOjXJFz2O9mbYiIqyfEgfrCmw==
X-Received: by 2002:a17:902:ecc1:b0:1ac:3605:97ec with SMTP id a1-20020a170902ecc100b001ac360597ecmr615508plh.62.1685663713896;
        Thu, 01 Jun 2023 16:55:13 -0700 (PDT)
Received: from localhost ([2405:6581:d4e0:1600:c494:2aca:bc01:6f7b])
        by smtp.gmail.com with ESMTPSA id e4-20020a17090301c400b001a6d4ffc760sm4054136plh.244.2023.06.01.16.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 16:55:13 -0700 (PDT)
Date: Fri, 2 Jun 2023 08:55:11 +0900
From: Nick Hastings <nicholaschastings@gmail.com>
To: "Limonciello, Mario" <mario.limonciello@amd.com>
Cc: Lyude Paul <lyude@redhat.com>, Lukas Wunner <lukas@wunner.de>,
	kherbst@redhat.com, Salvatore Bonaccorso <carnil@debian.org>,
	1036530@bugs.debian.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Regression from "ACPI: OSI: Remove Linux-Dell-Video _OSI
 string"? (was: Re: Bug#1036530: linux-signed-amd64: Hard lock up of system)
Message-ID: <ZHkv32h2F/AYmIqk@xps>
References: <ZHL5cCNUzVdleiag@eldamar.lan>
 <ab12984e-be17-903d-ba0a-f9c85b8c544f@amd.com>
 <ZHP4IqxBUPuVRvRV@xps>
 <09e24386-de63-e9e9-9e7f-5d04bad62d83@amd.com>
 <ZHQhPcKUF76Kplwm@xps>
 <ZHUt9xQKCwCflvVC@xps>
 <8537d965-ddf4-7f45-6459-d5acf520376e@amd.com>
 <ZHWfMBeAONerAJmd@xps>
 <ZHfa/wQlaVCeUC22@xps>
 <fe0ab1fa-6ed6-dc64-8165-8fc70669317b@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe0ab1fa-6ed6-dc64-8165-8fc70669317b@amd.com>

Hi,

* Limonciello, Mario <mario.limonciello@amd.com> [230602 01:18]:
> +Lyude, Lukas, Karol
> 
> On 5/31/2023 6:40 PM, Nick Hastings wrote:
> > 
> > * Nick Hastings <nicholaschastings@gmail.com> [230530 16:01]:
> > > * Mario Limonciello <mario.limonciello@amd.com> [230530 13:00]:
> > <snip>
> > > > As you're actually loading nouveau, can you please try nouveau.runpm=0 on
> > > > the kernel command line?
> > > I'm not intentionally loading it. This machine also has intel graphics
> > > which is what I prefer. Checking my
> > > /etc/modprobe.d/blacklist-nvidia-nouveau.conf
> > > I see:
> > > 
> > > blacklist nvidia
> > > blacklist nvidia-drm
> > > blacklist nvidia-modeset
> > > blacklist nvidia-uvm
> > > blacklist ipmi_msghandler
> > > blacklist ipmi_devintf
> > > 
> > > So I thought I had blacklisted it but it seems I did not. Since I do not
> > > want to use it maybe it is better to check if the lock up occurs with
> > > nouveau blacklisted. I will try that now.
> > I blacklisted nouveau and booted into a 6.1 kernel:
> > % uname -a
> > Linux xps 6.1.0-9-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.27-1 (2023-05-08) x86_64 GNU/Linux
> > 
> > It has been running without problems for nearly two days now:
> > % uptime
> >   08:34:48 up 1 day, 16:22,  2 users,  load average: 1.33, 1.26, 1.27
> > 
> > Regards,
> > 
> > Nick.
> 
> Thanks, that makes a lot more sense now.
> 
> Nick, Can you please test if nouveau works with runtime PM in the
> latest 6.4-rc?

I reported this twice already. I guess it was lost since for some
reason emails in this thread are not being trimmed. I'll repeat here:

I did eventually see a lockup of this kernel. On the console I saw:

[  151.035036] vfio-pci 0000:01:00.0 Unable to change power state from D3cold to D0, device inaccessible

I did not see the other two lines that were present in earlier lock ups.

Regards,

Nick.

