Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C2A10977
	for <regressions@lists.linux.dev>; Fri,  7 Jul 2023 21:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688766854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IR3UM/qERNeUL/EjPgvmk0ZZpn8WhkLUZx2wiiCSLjA=;
	b=M5q0D31kxgBZ6keatYpFl78vK2heboCSQKjl/DmXC+AC0P773ss+5F5szZ9LywRCVZyUO6
	amrIzZkcxC4gNL103pBdaGHT8p8X0La5gKuUcbyzViUNcI36Qrb+xbLGizuF2+hFfmffoF
	t9kvaA3CDr7hipHUfeTkqCabcuu7z0s=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-eeNfvWTrO_i3vOG8kpqZ9A-1; Fri, 07 Jul 2023 17:54:13 -0400
X-MC-Unique: eeNfvWTrO_i3vOG8kpqZ9A-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-635e664d2f8so25071206d6.3
        for <regressions@lists.linux.dev>; Fri, 07 Jul 2023 14:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688766853; x=1691358853;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IR3UM/qERNeUL/EjPgvmk0ZZpn8WhkLUZx2wiiCSLjA=;
        b=PDUcqoDqfcUcfHuFNynYh3gbgrhlAY1pqSXwcVL8tyGdp4yIXpjPnP0WVu94JXSi8p
         5dW2QEQDzBjuRNBDnKrbQOg7/1FJK87Koq5yQI+SrjUY8vTG76FPmioy8m4uUJhP3U80
         vK4OHlB5+1+uwmBC2YUxDIDTWvABVK0/nxAu2aIoI+DgEAIdfyHSaASKP9pffUYllFMf
         MjsH2Hz+Zb9YJLBu9TXEjsTrHu8ZqOH2oIWSFwsdxwBpYto0dyLiQlDdu+JMjdYHaSHt
         FmOcdxJw55gexX62oMrGAtDXwyl+FVfyiu1t40wyYD9eQvSzNs3lbhyY6X92vdNXQ8nz
         onHQ==
X-Gm-Message-State: ABy/qLbkaFz/+zw0WG+des8soIwb2i1jBXo4HF9sEHcC8WmPPYtbyYor
	/kok7c7uAKklR18QjQsjR5WI2PyLP1GmqAOF+SINXKgUtYrnrf8lPZmlfh9sBBB9hVnwUcKcqXS
	peyJcB8o1uYdLC7fPDOg/uyA=
X-Received: by 2002:a0c:cc10:0:b0:636:439b:a6de with SMTP id r16-20020a0ccc10000000b00636439ba6demr5936528qvk.13.1688766852901;
        Fri, 07 Jul 2023 14:54:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGy4rbv/6VC4l33AqtqHlOn3FLNo2hdcdd4j6YFakTEWNmLX49tDyvOehAct9nxQ75kSv1gPA==
X-Received: by 2002:a0c:cc10:0:b0:636:439b:a6de with SMTP id r16-20020a0ccc10000000b00636439ba6demr5936517qvk.13.1688766852667;
        Fri, 07 Jul 2023 14:54:12 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200:4d3e:bd5a:7e0a:133a? ([2600:4040:5c62:8200:4d3e:bd5a:7e0a:133a])
        by smtp.gmail.com with ESMTPSA id x10-20020a0ce24a000000b0063659410b04sm2470697qvl.107.2023.07.07.14.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 14:54:12 -0700 (PDT)
Message-ID: <79af2eab7409b75f5a2386fbd82c339111d6deab.camel@redhat.com>
Subject: Re: Regression from "ACPI: OSI: Remove Linux-Dell-Video _OSI
 string"? (was: Re: Bug#1036530: linux-signed-amd64: Hard lock up of system)
From: Lyude Paul <lyude@redhat.com>
To: "Limonciello, Mario" <mario.limonciello@amd.com>, Nick Hastings
	 <nicholaschastings@gmail.com>, Lukas Wunner <lukas@wunner.de>, 
	kherbst@redhat.com
Cc: Salvatore Bonaccorso <carnil@debian.org>, 1036530@bugs.debian.org, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 linux-acpi@vger.kernel.org,  linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
Date: Fri, 07 Jul 2023 17:54:11 -0400
In-Reply-To: <fe0ab1fa-6ed6-dc64-8165-8fc70669317b@amd.com>
References: <168471337231.1913606.15905047692536779158.reportbug@xps>
	 <ZHKrC4/G6ZyvRReI@xps> <ZHL5cCNUzVdleiag@eldamar.lan>
	 <ab12984e-be17-903d-ba0a-f9c85b8c544f@amd.com> <ZHP4IqxBUPuVRvRV@xps>
	 <09e24386-de63-e9e9-9e7f-5d04bad62d83@amd.com> <ZHQhPcKUF76Kplwm@xps>
	 <ZHUt9xQKCwCflvVC@xps> <8537d965-ddf4-7f45-6459-d5acf520376e@amd.com>
	 <ZHWfMBeAONerAJmd@xps> <ZHfa/wQlaVCeUC22@xps>
	 <fe0ab1fa-6ed6-dc64-8165-8fc70669317b@amd.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2023-06-01 at 11:18 -0500, Limonciello, Mario wrote:
> +Lyude, Lukas, Karol
>=20
> On 5/31/2023 6:40 PM, Nick Hastings wrote:
> > Hi,
> >=20
> > * Nick Hastings <nicholaschastings@gmail.com> [230530 16:01]:
> > > * Mario Limonciello <mario.limonciello@amd.com> [230530 13:00]:
> > <snip>
> > > > As you're actually loading nouveau, can you please try nouveau.runp=
m=3D0 on
> > > > the kernel command line?
> > > I'm not intentionally loading it. This machine also has intel graphic=
s
> > > which is what I prefer. Checking my
> > > /etc/modprobe.d/blacklist-nvidia-nouveau.conf
> > > I see:
> > >=20
> > > blacklist nvidia
> > > blacklist nvidia-drm
> > > blacklist nvidia-modeset
> > > blacklist nvidia-uvm
> > > blacklist ipmi_msghandler
> > > blacklist ipmi_devintf
> > >=20
> > > So I thought I had blacklisted it but it seems I did not. Since I do =
not
> > > want to use it maybe it is better to check if the lock up occurs with
> > > nouveau blacklisted. I will try that now.
> > I blacklisted nouveau and booted into a 6.1 kernel:
> > % uname -a
> > Linux xps 6.1.0-9-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.27-1 (2023-05=
-08) x86_64 GNU/Linux
> >=20
> > It has been running without problems for nearly two days now:
> > % uptime
> >   08:34:48 up 1 day, 16:22,  2 users,  load average: 1.33, 1.26, 1.27
> >=20
> > Regards,
> >=20
> > Nick.
>=20
> Thanks, that makes a lot more sense now.
>=20
> Nick, Can you please test if nouveau works with runtime PM in the
> latest 6.4-rc?
>=20
> If it works in 6.4-rc, there are probably nouveau commits that need
> to be backported to 6.1 LTS.
>=20
> If it's still broken in 6.4-rc, I believe you should file a bug:
>=20
> https://gitlab.freedesktop.org/drm/nouveau/
>=20
>=20
> Lyude, Lukas, Karol
>=20
> This thread is in relation to this commit:
>=20
> 24867516f06d ("ACPI: OSI: Remove Linux-Dell-Video _OSI string")
>=20
> Nick has found that runtime PM is *not* working for nouveau.
>=20
> If you recall we did 24867516f06d because 5775b843a619 was
> supposed to have fixed it.

Gotcha, I guess keep me updated since it seems like things -might- be worki=
ng
from what I gathered here? Happy to look further if they find that 6.4-rc i=
s
broken though

>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

