Received: from mx-2023-1.gwdg.de (mx-2023-1.gwdg.de [134.76.10.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1575393DDF
	for <regressions@lists.linux.dev>; Tue,  7 Apr 2026 07:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.76.10.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775546938; cv=none; b=EMKuldyuRYsH+kpNDHkEL1owIJwerCxp73s5TYIXF+GE2rIASXOnsXJiA89jRJhZnm+WdyesrVTrCuLdaxnMiR5mLorXxsttDHxhwgQn/emvvNtLSBd6pO8Mpqd7eCtQJcLINoYJtyYyzlI1RZrad4msG/16wwDdRmOl8Cf5nHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775546938; c=relaxed/simple;
	bh=TlSXuAmgpqXb3WrRqkSjPz6ba3WbLdVEW77hhJp7q5g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c6uwXgkPZQUPtqGTKaE9cWNco85CLBiy/fUHbcW4+yGC0vyvwbMoRCklBlPdm/ZclRcjNGKnSaW6p6ortdKw/45wkTy1yitnnkP+2OPKYY17nuzkHmHITUmzUwAs3XZuAyNhMEhHv/qOwfAT+lHqxdZQSNWmVFZvWZ4865xQdY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ipp.mpg.de; spf=pass smtp.mailfrom=ipp.mpg.de; dkim=pass (2048-bit key) header.d=ipp.mpg.de header.i=@ipp.mpg.de header.b=dcHuTZOG; arc=none smtp.client-ip=134.76.10.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ipp.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ipp.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ipp.mpg.de header.i=@ipp.mpg.de header.b="dcHuTZOG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ipp.mpg.de;
	s=2023-rsa; h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To
	:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=TlSXuAmgpqXb3WrRqkSjPz6ba3WbLdVEW77hhJp7q5g=; b=dcHuTZOGGhkiEWIgRGcpy2iPAc
	FaDmYTfVIUaV8uJSXk7K7bOGoOlqt4LAQRBSpZ51/rka8T3xsxCXoJWqNAi0E1ET51Soh/6Lno4u6
	6JB9syvHppGRXfJtSnUUQKISJ9cmFH9A6Voto+ysqh/wcfNeaYAdnDB9CoYsKNCz2EjyZGPEL1myd
	mc5zV9OPBNcB/tZ0KqtH4jm/2i7IXgkvWTFLk5n0ddylrdTDrE2PQ2Tbq2SKn7yBjiAl4+2wrEDi4
	R54w6TJIcN67vK6qPsWHbYwOFA8lnYTasGxFiXoNqB12uXawSHWmVDcCCWwwUCGrc9PIaMUnFDrcU
	GIN/Rb2w==;
Received: from mailer.gwdg.de ([134.76.10.26]:35846)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <simon.fischer@ipp.mpg.de>)
	id 1wA0rl-0046Tr-0C;
	Tue, 07 Apr 2026 09:28:53 +0200
Received: from mbx19-gwd-05.um.gwdg.de ([10.108.142.58] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	(GWDG Mailer)
	(envelope-from <simon.fischer@ipp.mpg.de>)
	id 1wA0rl-000Ai1-2h;
	Tue, 07 Apr 2026 09:28:53 +0200
Received: from MBX19-SUB-03.um.gwdg.de (10.108.142.68) by
 MBX19-GWD-05.um.gwdg.de (10.108.142.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 7 Apr 2026 09:28:48 +0200
Received: from MBX19-SUB-03.um.gwdg.de ([10.108.142.68]) by
 MBX19-SUB-03.um.gwdg.de ([10.108.142.68]) with mapi id 15.02.2562.037; Tue, 7
 Apr 2026 09:28:48 +0200
From: "Fischer, Simon" <simon.fischer@ipp.mpg.de>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: AW: Lowspeed USB device enumerationg under 5.4.288, but not under
 6.8.1
Thread-Topic: Lowspeed USB device enumerationg under 5.4.288, but not under
 6.8.1
Thread-Index: AdzCs+1oMfzeuAm2S72W6S8kW/Ma3P//7O4A//iWntA=
Date: Tue, 7 Apr 2026 07:28:48 +0000
Message-ID: <d1408c3a36944b97a278b0b6f905dd11@ipp.mpg.de>
References: <8a29db20f78046578e8dc2c516607240@ipp.mpg.de>
 <2026040255-zone-chamomile-964f@gregkh>
In-Reply-To: <2026040255-zone-chamomile-964f@gregkh>
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

On 4/2/26 18:10, Greg KH wrote:
> On Thu, Apr 02, 2026 at 03:34:35PM +0000, Fischer, Simon wrote:
> > Dear list,
> >
> > I've tried to dig deeper into the issues, tried different quirks and sm=
all
> patches, but was unable to solve this or find the root cause. As this see=
ms to
> be a regression of 6.8 from 5.4, I hope this is the correct list?
>=20
> 6.8.1 is not supported by anyone but canonical, so there's not much we
> can do here, sorry as that is a very old and obsolete kernel missing
> tens of thousands of changes.
>=20
> Can you try running the latest 6.19 release instead?

Sorry, seems me or my outlook messed something up with the correct reply fo=
rmat...

I've tried 6.19.11 now and it shows the same behavior as in my original mai=
l.
Currently building 5.15.202 and 6.0.19 to cross check.

Thanks & bests
Simon

>=20
> thanks,
>=20
> greg k-h
