Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EA36B3A6
	for <regressions@lists.linux.dev>; Thu,  1 Jun 2023 16:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685637201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lKfNaN4l/MR8zlLzyVVW3/Ll4oj7wzuBoASQm/awxOs=;
	b=R9TqJXdwZO/16nglc0belNuDy2umOpByCMZBSSJ8Kuk3fR5th/5pDQPcdf+e4YVD0LHttL
	3hqFHACSTEe/UXAM/kRgh+LGeo00zzhpuF/hHzrNe9/8wA8pyI475+udb51o4xYfMZsvka
	zG2DdyDxDl3aYm2DBQGbXbLI1IxbS68=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-RNLuFZM_PmqipqlxVwNuMA-1; Thu, 01 Jun 2023 12:33:19 -0400
X-MC-Unique: RNLuFZM_PmqipqlxVwNuMA-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2af203c899cso731fa.1
        for <regressions@lists.linux.dev>; Thu, 01 Jun 2023 09:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685637198; x=1688229198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKfNaN4l/MR8zlLzyVVW3/Ll4oj7wzuBoASQm/awxOs=;
        b=Ksartcyj6jJpj+XeBP/pjpRaH/NgqK1ecmaToTXohfH0N37NrallzOjKotFFjOePTP
         boS7eEGSXFnGJNc5vTrHigjzV/AZxodCp/J/74+rO2NBfNNLKz91MblPa2lIq8oE4l8V
         XZL2E9WT+OUUjX/jy2ouYHlLfdP/ODs1dPghKLQAXMBy1IJfTA1sdvWUd0q8NLzLjqqI
         mjrdKtz10LtDgw6HRzxJ7VI9OQ0ESp7qwCjAIMDJTKAVPw+o/ujSkZHvjwhrvUQG0Wuz
         S7QUtXY0OpD9NAMp73Qchd9cgxuWmR7qJ98iIyqpyKVXCxPnHYegQVJjVdIDlivyc8/f
         aDxg==
X-Gm-Message-State: AC+VfDwcWTTPXBdUAwc2hRxjsT8SExiDSn2kqeHeEObkTnHoB065QQf9
	JTUsNaqwM42JXDDWZRHhhUZBE0vjbEn508/lQK6uJD78K7uJrG4Tn9IBVdonS2JNBtQVSJ+nezI
	phYvWZjOzhxGUwqEWkO52fHJSJQxu9CM6r8vdR6U=
X-Received: by 2002:a2e:a4ac:0:b0:2b1:a69e:6a8e with SMTP id g12-20020a2ea4ac000000b002b1a69e6a8emr925282ljm.3.1685637198424;
        Thu, 01 Jun 2023 09:33:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6sX+gZm7ZA5+9vSBRoryBdVNamolMuCnhrtAuIzv4GVF3xl6ftjdZdgSxoZfJGJTNBJipxrwFfnfQLsuMLFeU=
X-Received: by 2002:a2e:a4ac:0:b0:2b1:a69e:6a8e with SMTP id
 g12-20020a2ea4ac000000b002b1a69e6a8emr925265ljm.3.1685637198130; Thu, 01 Jun
 2023 09:33:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <168471337231.1913606.15905047692536779158.reportbug@xps>
 <ZHKrC4/G6ZyvRReI@xps> <ZHL5cCNUzVdleiag@eldamar.lan> <ab12984e-be17-903d-ba0a-f9c85b8c544f@amd.com>
 <ZHP4IqxBUPuVRvRV@xps> <09e24386-de63-e9e9-9e7f-5d04bad62d83@amd.com>
 <ZHQhPcKUF76Kplwm@xps> <ZHUt9xQKCwCflvVC@xps> <8537d965-ddf4-7f45-6459-d5acf520376e@amd.com>
 <ZHWfMBeAONerAJmd@xps> <ZHfa/wQlaVCeUC22@xps> <fe0ab1fa-6ed6-dc64-8165-8fc70669317b@amd.com>
In-Reply-To: <fe0ab1fa-6ed6-dc64-8165-8fc70669317b@amd.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 1 Jun 2023 18:33:07 +0200
Message-ID: <CACO55tsuO1kQUFfPdPFUHm4WEQseCR2tQSDhFRzR+8wOECZCyA@mail.gmail.com>
Subject: Re: Regression from "ACPI: OSI: Remove Linux-Dell-Video _OSI string"?
 (was: Re: Bug#1036530: linux-signed-amd64: Hard lock up of system)
To: "Limonciello, Mario" <mario.limonciello@amd.com>
Cc: Nick Hastings <nicholaschastings@gmail.com>, Lyude Paul <lyude@redhat.com>, 
	Lukas Wunner <lukas@wunner.de>, Salvatore Bonaccorso <carnil@debian.org>, 1036530@bugs.debian.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 1, 2023 at 6:18=E2=80=AFPM Limonciello, Mario
<mario.limonciello@amd.com> wrote:
>
> +Lyude, Lukas, Karol
>
> On 5/31/2023 6:40 PM, Nick Hastings wrote:
> > Hi,
> >
> > * Nick Hastings <nicholaschastings@gmail.com> [230530 16:01]:
> >> * Mario Limonciello <mario.limonciello@amd.com> [230530 13:00]:
> > <snip>
> >>> As you're actually loading nouveau, can you please try nouveau.runpm=
=3D0 on
> >>> the kernel command line?
> >> I'm not intentionally loading it. This machine also has intel graphics
> >> which is what I prefer. Checking my
> >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf
> >> I see:
> >>
> >> blacklist nvidia
> >> blacklist nvidia-drm
> >> blacklist nvidia-modeset
> >> blacklist nvidia-uvm
> >> blacklist ipmi_msghandler
> >> blacklist ipmi_devintf
> >>
> >> So I thought I had blacklisted it but it seems I did not. Since I do n=
ot
> >> want to use it maybe it is better to check if the lock up occurs with
> >> nouveau blacklisted. I will try that now.
> > I blacklisted nouveau and booted into a 6.1 kernel:
> > % uname -a
> > Linux xps 6.1.0-9-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.27-1 (2023-05=
-08) x86_64 GNU/Linux
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
>
> If it works in 6.4-rc, there are probably nouveau commits that need
> to be backported to 6.1 LTS.
>
> If it's still broken in 6.4-rc, I believe you should file a bug:
>
> https://gitlab.freedesktop.org/drm/nouveau/
>
>
> Lyude, Lukas, Karol
>
> This thread is in relation to this commit:
>
> 24867516f06d ("ACPI: OSI: Remove Linux-Dell-Video _OSI string")
>
> Nick has found that runtime PM is *not* working for nouveau.
>

keep in mind we have a list of PCIe controllers where we apply a
workaround: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/tree/drivers/gpu/drm/nouveau/nouveau_drm.c?h=3Dv6.4-rc4#n682

And I suspect there might be one or two more IDs we'll have to add
there. Do we have any logs? And could anybody test if adding the
controller in play here does resolve the problem?

> If you recall we did 24867516f06d because 5775b843a619 was
> supposed to have fixed it.
>

