Received: from mx-2023-1.gwdg.de (mx-2023-1.gwdg.de [134.76.10.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C50219FC
	for <regressions@lists.linux.dev>; Wed,  6 May 2026 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.76.10.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054313; cv=none; b=Uptu8h4mSNOxTX3AlzR51HGQDDg0nFsvYQmJXohFJsMaI8QPcDnKQqEIpFNvXLPBX82Ivjn7+LDbUcYTxCi7aO/y2+YP526jImoqocaatYRLO+3l+u35K/5BXGSSNA7nCOfT2n8ciGcQebwi9SeVLdSR459uLFs6A9aidN3KXN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054313; c=relaxed/simple;
	bh=nmsXdp0DpS/f+3j7SxP7pzkggvxdC0kmCi0LipJuqzw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NkBtt3iiBz3JLhuXi7tdVJRidigXG/1yHqkV0GY9w8orkofWOdLlE29QieGLftp8UkSM50K4U4RM3l6F66AmpuEQ9EVMefWemXegdE1klCuTzanExF/inQN7jcxYj1QRROzs+JD//Z+MwoYFx1W04NR/VbjFf3gg9gQ6R4colC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ipp.mpg.de; spf=pass smtp.mailfrom=ipp.mpg.de; dkim=pass (2048-bit key) header.d=ipp.mpg.de header.i=@ipp.mpg.de header.b=Rvbn4YHe; arc=none smtp.client-ip=134.76.10.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ipp.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ipp.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ipp.mpg.de header.i=@ipp.mpg.de header.b="Rvbn4YHe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ipp.mpg.de;
	s=2023-rsa; h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wjngW6tiilQHVTLQs9j41/ugcNtgL1URak4KUCE9C20=; b=Rvbn4YHeQJ3+oh64HaBM4IjqlL
	UjobogA5YjR/+3j/djHeY+EXZtsfJkVYlHIEk5nutmKo0JqKJNhs88+wKCgGbdQVCVNjizwJ2O7Xd
	P4/AWa5QJtaQI5TCiajmNBPFDqtTU7g7c0kVQra2RrKILLTYwMnud91LUbYxS0P3MvMvG2s9z4Hn5
	9RMHbicgPpCztgOglVXFsyKMwMRzsA03avK774Fqkfy+m+K75hcspS/kzZn2CjwBUdvDJSFMdqOnR
	VXzYKQ4pBxDIvCAUgbxbxHD1tEPY3i/sO3Ga3ZQwwYFPNY9ZMenm71i4sDbT3rRN5QmcANTpkuNy5
	bTmy/naQ==;
Received: from mailer.gwdg.de ([134.76.10.26]:55780)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <simon.fischer@ipp.mpg.de>)
	id 1wKWXw-00GgP6-2b;
	Wed, 06 May 2026 09:19:53 +0200
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <simon.fischer@ipp.mpg.de>)
	id 1wKWXx-000Da8-1s;
	Wed, 06 May 2026 09:19:53 +0200
Received: from MBX19-SUB-03.um.gwdg.de (10.108.142.68) by
 MBX19-SUB-05.um.gwdg.de (10.108.142.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Wed, 6 May 2026 09:19:53 +0200
Received: from MBX19-SUB-03.um.gwdg.de ([10.108.142.68]) by
 MBX19-SUB-03.um.gwdg.de ([10.108.142.68]) with mapi id 15.02.2562.037; Wed, 6
 May 2026 09:19:53 +0200
From: "Fischer, Simon" <simon.fischer@ipp.mpg.de>
To: Michal Pecio <michal.pecio@gmail.com>
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: RE: Lowspeed USB device enumerationg under 5.4.288, but not under
 6.8.1
Thread-Topic: Lowspeed USB device enumerationg under 5.4.288, but not under
 6.8.1
Thread-Index: AdzdJo3z45kiUj3OTySYjjv1p7YIIA==
Date: Wed, 6 May 2026 07:19:53 +0000
Message-ID: <50fff510499b47d09df9317855680552@ipp.mpg.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Virus-Scanned: (clean) by clamav
X-Spam-Level: -



> On Wed, 6 May 2026 08:58, Pecio, Michal wrote:=20
> > On Thu, 2 Apr 2026 15:34:35 +0000, Fischer, Simon wrote:
> > Dear list,
> >
> > I've tried to dig deeper into the issues, tried different quirks and
> > small patches, but was unable to solve this or find the root cause.
> > As this seems to be a regression of 6.8 from 5.4, I hope this is the
> > correct list?
> >
> > I got setup with a low speed isochronous USB device (Optec filter
> > wheel), that is connected to a Dell R6515 server via a Lindy 300m 2
> > Port Fibre Optic USB 3.0 Extender (which enumerates as a chain of
> > USB3 super speed hubs). The server is running Ubuntu 24.04 with a
> > 6.8.1 RT kernel. When connecting the device, it fails to enumerate:
>=20
> Hi,
>=20
> Are you still fighting with this?
>=20
> I'm afraid I have no better suggestions than others: bisect it.
> To avoid bisecting all commits, you could manually bisect major
> releases and then test USB commits added by the "bad" release,
> as the problem likely came from USB subsystem.
>=20
> By "low speed", do you mean the 1Mbps data rate defined by USB 1.x?
> That's odd, such devices aren't allowed to use isochronous endpoints
> so it would be big luck if they work at all with any SW and HW.
>=20
> Would you mind posting its 'lsusb -v', from the working system?
>=20
> Your log shows a failure to enumerate some SuperSpeed device, while
> any USB1/USB2 device should be showing on another bus (probably 1),
> unless your range extender somehow changes "apparent" speed.
>=20
> Also, if the problem reproduces on current kernels, you could try
> sending logs (from a current kernel) to linux-usb in order to reach
> more USB developers.
>=20
> Regards,
> Michal

Hi Michal,

thanks for coming back. I had as of yet postponing an update for workload r=
easons, but mostly because my Outlook is very bad at following the rules of=
 this mailing list :-)

I have been able to reproduce the problem with a current (6.19) kernel and =
independent of PREEMPT_RT status. But I have also been able to identify tha=
t the difference between my Ubuntu provided 5.4 and 6.8 kernels that leads =
to the problem, is actually the CONFIG_HZ build config parameter.

Ubuntu's 6.8 kernel is by default built with CONFIG_HZ=3D1000, while the ol=
d 5.4 kernel was built with CONFIG_HZ=3D250. If I rebuild Ubuntu's 5.4 with=
 1000Hz, I also cannot talk to the devices, and when I compile 6.19 or 6.8 =
with 250Hz, they work (currently running a rebuilt Ubuntu 6.8.1 with only t=
hat one parameter updated, I sometimes still see errors, but an automatic r=
etry of the driver is then successful).

So, a regression this is not :-)

Since I cannot imagine in what way the system interrupt frequency would dir=
ectly affect this part in such a reproducible and significant manner, I wou=
ld think it more likely that the USB core or xhci drivers actually use that=
 setting value somewhere themselves and maybe wrongly. So this should proba=
bly realy go to some other list. If you know which, I would greatly appreci=
ate you forwarding my information  or telling me where to take it.

Thanks a lot & best regards
Simon

>=20
> > [...]
> >
> >
> > When booting into a 5.4.288 PREEMPT_RT kernel we were using before
> > with, everything works fine (device enumerates and works). When
> > exchanging the USB Extender for a Lindy 200m Fibre Optic USB 2.0
> > Extender, everything works fine with the 6.8.1 kernel. I cannot
> > inject a USB 2.0 hub before the extender, because it is a super speed
> > device and not compatible.
> >
> > Any suggestions how to fix or further investigate the issue would be
> > greatly appreciated!
> >
> > Kind regards
> > Simon Fischer
> >
> >
> > Developer
> > Department E5 - CoDaC
> >
> >
> > Max Planck Institute for Plasmaphysics
> > Wendelsteinstrasse 1
> > 17491 Greifswald, Germany
> >
> > Phone: +49(0)3834 88 1215
> >
