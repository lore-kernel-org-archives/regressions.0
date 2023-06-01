Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343F94253A
	for <regressions@lists.linux.dev>; Thu,  1 Jun 2023 17:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685639942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N7Mnlp0aSiXHT6Q09OS24+TgfPuSnXNbcRqOsgVtEPw=;
	b=Q+INa2sM34bfV+eCoGfw/XNLUJ0E9L0opS6NVo176wSK/ndS0P8HzTPeE4Tj0eYCSBlVyc
	SLsdvZnIjWOPsKMN0gofCTVzKDcHUCSUSEDufbYSwWvsf7jwG0BTW7ltdCntIzYESJ27eP
	V2XaIgjvL+HHIjApVvlB/cp+VmLDBPU=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-CR--yjruO-SS8PQu-Vh-YA-1; Thu, 01 Jun 2023 13:19:01 -0400
X-MC-Unique: CR--yjruO-SS8PQu-Vh-YA-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2b060345eeeso1952631fa.0
        for <regressions@lists.linux.dev>; Thu, 01 Jun 2023 10:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685639939; x=1688231939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7Mnlp0aSiXHT6Q09OS24+TgfPuSnXNbcRqOsgVtEPw=;
        b=IBytqOUr6Ew+ht91cUu2DSappqeI//AcNuNoJvdOgqKnJlvFRZhMknvq6xdIH9QZUH
         az6R/M6Rze4g55mfxHPM4hgS5LYhi13jmD1PRRgZkQ46bq6mWj9pnSJaQO5vovVWL3Qx
         QIQtO2QjyNT/8OpP/kBi/6vPzhgIfk9Vh4oFt8hr9pMvWM0AR9Nk16uUgNhZSg0N2SVv
         gTYiKzTc1TjUWCJP1DW+N/HnCb+ooDj3IpENc/A9eozJxTw6cj7INIss5JrZZQdiOix6
         U9KmAU7BSJHMOU1zSjwkLsQHhfI6Y5DVrOUIlu0yLfoZ+VDJJa16DX/dAxdaVFF4yqFz
         eBig==
X-Gm-Message-State: AC+VfDxYMfKnfsDyxT21KGkHJxWlbv4Py2H5TqtHqfDdiX8q4x7fNRSb
	BJUZ2WCf0mI8on1wvqX4A18uPdUUT7SPJ6t2PtUQ6ceVIjWzvfPUpd1RdSLUP51n+uAk6nXbvLd
	6N6McQdKVK2iIxDzs4husNqUvJcuq1v5Yxhottqo=
X-Received: by 2002:a2e:8e71:0:b0:2b1:a85a:6921 with SMTP id t17-20020a2e8e71000000b002b1a85a6921mr403199ljk.0.1685639939548;
        Thu, 01 Jun 2023 10:18:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5rfmyLTOgMU+Rj/Yr0M7d7y4Kx24OeGQ0+B4ybvXpab1i+jijHtMfv9wI5f+xv2TyjxEy5XIuuljwEWwLOt08=
X-Received: by 2002:a2e:8e71:0:b0:2b1:a85a:6921 with SMTP id
 t17-20020a2e8e71000000b002b1a85a6921mr403186ljk.0.1685639939234; Thu, 01 Jun
 2023 10:18:59 -0700 (PDT)
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
 <CACO55tsuO1kQUFfPdPFUHm4WEQseCR2tQSDhFRzR+8wOECZCyA@mail.gmail.com> <MN0PR12MB61017541F5AC55485A490BCDE2499@MN0PR12MB6101.namprd12.prod.outlook.com>
In-Reply-To: <MN0PR12MB61017541F5AC55485A490BCDE2499@MN0PR12MB6101.namprd12.prod.outlook.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 1 Jun 2023 19:18:48 +0200
Message-ID: <CACO55tudULtvt_Hcdg+uqXeYkSAR_NZ1oD=R_KhuE_THSRe88g@mail.gmail.com>
Subject: Re: Regression from "ACPI: OSI: Remove Linux-Dell-Video _OSI string"?
 (was: Re: Bug#1036530: linux-signed-amd64: Hard lock up of system)
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc: Nick Hastings <nicholaschastings@gmail.com>, Lyude Paul <lyude@redhat.com>, 
	Lukas Wunner <lukas@wunner.de>, Salvatore Bonaccorso <carnil@debian.org>, 
	"1036530@bugs.debian.org" <1036530@bugs.debian.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 1, 2023 at 6:54=E2=80=AFPM Limonciello, Mario
<Mario.Limonciello@amd.com> wrote:
>
> [AMD Official Use Only - General]
>
> > -----Original Message-----
> > From: Karol Herbst <kherbst@redhat.com>
> > Sent: Thursday, June 1, 2023 11:33 AM
> > To: Limonciello, Mario <Mario.Limonciello@amd.com>
> > Cc: Nick Hastings <nicholaschastings@gmail.com>; Lyude Paul
> > <lyude@redhat.com>; Lukas Wunner <lukas@wunner.de>; Salvatore
> > Bonaccorso <carnil@debian.org>; 1036530@bugs.debian.org; Rafael J.
> > Wysocki <rafael@kernel.org>; Len Brown <lenb@kernel.org>; linux-
> > acpi@vger.kernel.org; linux-kernel@vger.kernel.org;
> > regressions@lists.linux.dev
> > Subject: Re: Regression from "ACPI: OSI: Remove Linux-Dell-Video _OSI
> > string"? (was: Re: Bug#1036530: linux-signed-amd64: Hard lock up of sys=
tem)
> >
> > On Thu, Jun 1, 2023 at 6:18=E2=80=AFPM Limonciello, Mario
> > <mario.limonciello@amd.com> wrote:
> > >
> > > +Lyude, Lukas, Karol
> > >
> > > On 5/31/2023 6:40 PM, Nick Hastings wrote:
> > > > Hi,
> > > >
> > > > * Nick Hastings <nicholaschastings@gmail.com> [230530 16:01]:
> > > >> * Mario Limonciello <mario.limonciello@amd.com> [230530 13:00]:
> > > > <snip>
> > > >>> As you're actually loading nouveau, can you please try
> > nouveau.runpm=3D0 on
> > > >>> the kernel command line?
> > > >> I'm not intentionally loading it. This machine also has intel grap=
hics
> > > >> which is what I prefer. Checking my
> > > >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf
> > > >> I see:
> > > >>
> > > >> blacklist nvidia
> > > >> blacklist nvidia-drm
> > > >> blacklist nvidia-modeset
> > > >> blacklist nvidia-uvm
> > > >> blacklist ipmi_msghandler
> > > >> blacklist ipmi_devintf
> > > >>
> > > >> So I thought I had blacklisted it but it seems I did not. Since I =
do not
> > > >> want to use it maybe it is better to check if the lock up occurs w=
ith
> > > >> nouveau blacklisted. I will try that now.
> > > > I blacklisted nouveau and booted into a 6.1 kernel:
> > > > % uname -a
> > > > Linux xps 6.1.0-9-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.27-1
> > (2023-05-08) x86_64 GNU/Linux
> > > >
> > > > It has been running without problems for nearly two days now:
> > > > % uptime
> > > >   08:34:48 up 1 day, 16:22,  2 users,  load average: 1.33, 1.26, 1.=
27
> > > >
> > > > Regards,
> > > >
> > > > Nick.
> > >
> > > Thanks, that makes a lot more sense now.
> > >
> > > Nick, Can you please test if nouveau works with runtime PM in the
> > > latest 6.4-rc?
> > >
> > > If it works in 6.4-rc, there are probably nouveau commits that need
> > > to be backported to 6.1 LTS.
> > >
> > > If it's still broken in 6.4-rc, I believe you should file a bug:
> > >
> > > https://gitlab.freedesktop.org/drm/nouveau/
> > >
> > >
> > > Lyude, Lukas, Karol
> > >
> > > This thread is in relation to this commit:
> > >
> > > 24867516f06d ("ACPI: OSI: Remove Linux-Dell-Video _OSI string")
> > >
> > > Nick has found that runtime PM is *not* working for nouveau.
> > >
> >
> > keep in mind we have a list of PCIe controllers where we apply a
> > workaround:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers
> > /gpu/drm/nouveau/nouveau_drm.c?h=3Dv6.4-rc4#n682
> >
> > And I suspect there might be one or two more IDs we'll have to add
> > there. Do we have any logs?
>
> There's some archived onto the distro bug.  Search this page for "journal=
ctl.log.gz"
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1036530
>

interesting.. It seems to be the same controller used here. I wonder
if the pci topology is different or if the workaround is applied at
all.

But yeah, I'd kinda love for somebody with better knowledge on all of
this to figure out what exactly is going wrong, but everytime this
gets investigated Intel says "our hardware has no bugs", the ACPI
folks dig for months and find nothing and I end up figuring out some
weirdo workaround I don't understand. And apparently also nobody is
able to hand out docs explaining in detail how that runtime
suspend/resume stuff is supposed to work.

I have a Dell XPS 9560 where the added workaround in nouveau fixed the
problem and I know it's fixed on a bunch of other systems. So if
anybody is willing to publish docs and/or actually debug it with
domain knowledge, please go ahead.

> > And could anybody test if adding the
> > controller in play here does resolve the problem?
> >
> > > If you recall we did 24867516f06d because 5775b843a619 was
> > > supposed to have fixed it.
> > >
>

