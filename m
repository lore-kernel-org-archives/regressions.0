Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED00168A8
	for <regressions@lists.linux.dev>; Wed, 31 May 2023 23:40:51 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-bacfc573647so198901276.1
        for <regressions@lists.linux.dev>; Wed, 31 May 2023 16:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685576450; x=1688168450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l9Ip848C4+PX4sdvUZ6qA+ntR4dfPFEEj72E1ynrboE=;
        b=pmbEWlVHe2mnM0kY4kuCc8OnetP493gSGJbXzI0xxIWrd9LL1PS2D18wAYrEiMStCL
         kSECDoiKsGntGM8Qe/H2nkvREyJNry15290+xo6UUF35/UPatbv6uJYbVG75Wk1ONQIB
         AhH3qjpWVy+4GBZzEN8xgxZQj/Tkd9S/nyJOfXlCLlVtdAyGu1P4o2u717AiWZHW+c19
         D9CZ3d2bRgmD/JPI/4xt4fIi70g3/Nf8LyKL9Sezm1/8Wh3MZW0c52CUJ3wOBk5cjZHV
         36lw14neIoDR3GRB63G/ON1Kt5h0Y3kUvJYPlfYKlmBByDCkTwVXClzuw4iAC0VK+B4k
         MDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685576450; x=1688168450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9Ip848C4+PX4sdvUZ6qA+ntR4dfPFEEj72E1ynrboE=;
        b=fGRHa6zC29So5vBXoux0y/Sh8C4k24vQ6JyyxOO3qWREQOWTLK7Okl33a/YNRqC9qn
         Bunt2AIHOW6jDhwkgl9hH1JpRzTPKODNpJjoVZxA5SfsRtAQ3CCyOov+2hN+T57xirrt
         8Ns0tMwgSL/CrPw8k+uO/d3Xrj8oFhlZEBgPriOtdaY7JdsPthNz40czqsMM2mSn50QH
         IOrxIV6XDoiVuBBjxQkuz8h3B5E5LpOeHRnGgIKIMSd5045dloYvmqen/dEv1csm55mV
         0vgu4zSwda7efed9cJPqNQShQDm3Ceq2mLbsq50J2xh/tzBcm41oPIlJJAYESaqEqJun
         DCDg==
X-Gm-Message-State: AC+VfDzP8zVSCUMO30Hge7Ox3iGApb72PbNbaLe/UBzIzEa02jbHWrFC
	URfoXR8Nzxv+SbtGkQ9N1jA=
X-Google-Smtp-Source: ACHHUZ6hg+BzE3S+Lb8Ii8mZm+C3Ly8o+bGGFHw0M9DuMbORKjj6D6SrCydAYiE87Dhw9g1FQVOWtA==
X-Received: by 2002:a25:be04:0:b0:bab:f4bb:9402 with SMTP id h4-20020a25be04000000b00babf4bb9402mr7628265ybk.46.1685576450666;
        Wed, 31 May 2023 16:40:50 -0700 (PDT)
Received: from localhost ([2405:6581:d4e0:1600:c494:2aca:bc01:6f7b])
        by smtp.gmail.com with ESMTPSA id ja10-20020a170902efca00b001b0358848b0sm1957355plb.161.2023.05.31.16.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 16:40:49 -0700 (PDT)
Date: Thu, 1 Jun 2023 08:40:47 +0900
From: Nick Hastings <nicholaschastings@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Salvatore Bonaccorso <carnil@debian.org>, 1036530@bugs.debian.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Regression from "ACPI: OSI: Remove Linux-Dell-Video _OSI
 string"? (was: Re: Bug#1036530: linux-signed-amd64: Hard lock up of system)
Message-ID: <ZHfa/wQlaVCeUC22@xps>
References: <168471337231.1913606.15905047692536779158.reportbug@xps>
 <ZHKrC4/G6ZyvRReI@xps>
 <ZHL5cCNUzVdleiag@eldamar.lan>
 <ab12984e-be17-903d-ba0a-f9c85b8c544f@amd.com>
 <ZHP4IqxBUPuVRvRV@xps>
 <09e24386-de63-e9e9-9e7f-5d04bad62d83@amd.com>
 <ZHQhPcKUF76Kplwm@xps>
 <ZHUt9xQKCwCflvVC@xps>
 <8537d965-ddf4-7f45-6459-d5acf520376e@amd.com>
 <ZHWfMBeAONerAJmd@xps>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHWfMBeAONerAJmd@xps>

Hi,

* Nick Hastings <nicholaschastings@gmail.com> [230530 16:01]:
> 
> * Mario Limonciello <mario.limonciello@amd.com> [230530 13:00]:
<snip>
> > As you're actually loading nouveau, can you please try nouveau.runpm=0 on
> > the kernel command line?
> 
> I'm not intentionally loading it. This machine also has intel graphics
> which is what I prefer. Checking my
> /etc/modprobe.d/blacklist-nvidia-nouveau.conf
> I see:
> 
> blacklist nvidia
> blacklist nvidia-drm
> blacklist nvidia-modeset
> blacklist nvidia-uvm
> blacklist ipmi_msghandler
> blacklist ipmi_devintf
> 
> So I thought I had blacklisted it but it seems I did not. Since I do not
> want to use it maybe it is better to check if the lock up occurs with
> nouveau blacklisted. I will try that now.

I blacklisted nouveau and booted into a 6.1 kernel:
% uname -a
Linux xps 6.1.0-9-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.27-1 (2023-05-08) x86_64 GNU/Linux

It has been running without problems for nearly two days now:
% uptime
 08:34:48 up 1 day, 16:22,  2 users,  load average: 1.33, 1.26, 1.27

Regards,

Nick.

