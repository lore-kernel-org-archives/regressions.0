Received: from mx-2023-1.gwdg.de (mx-2023-1.gwdg.de [134.76.10.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADABB27603F
	for <regressions@lists.linux.dev>; Tue,  7 Apr 2026 06:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.76.10.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775543606; cv=none; b=s1U+aofybjuhRsX0IHpbKeiXa8v/APB8TUbHniHuLZ2f5HYve30j4DaGbjqWGooB5hlCIa1NUIj60FcmxaeBbcOvI6DjKu9tM/yCNbp7Ve0nmYXqNVHX/EduVZVL5Js0vsHnPOf0MrNKRn1jVAQJ/LVl/OnCrN63Nu/t4XFkPrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775543606; c=relaxed/simple;
	bh=2RAdJ7qWpDrZMyYi9UYOT/VPpumKaGmMKyLiPh2Mh2Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kLoUrwP75FygomJYrBEtiLHURW/ggMhVc6uE1PxtgVB/DV2RCwDE2Ik7dgN3Et8GPBe/bmAqBu1mvhqpU/2cnPrQjZnRcy4b9UBe/UoiFfnc/byKOfD0nFx/DjyWFVXROPG0O4dnNv+qIvwjWevTpU/2fuI+8xeL8+ytDn86llc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ipp.mpg.de; spf=pass smtp.mailfrom=ipp.mpg.de; dkim=pass (2048-bit key) header.d=ipp.mpg.de header.i=@ipp.mpg.de header.b=HIvTOFMO; arc=none smtp.client-ip=134.76.10.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ipp.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ipp.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ipp.mpg.de header.i=@ipp.mpg.de header.b="HIvTOFMO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ipp.mpg.de;
	s=2023-rsa; h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To
	:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2RAdJ7qWpDrZMyYi9UYOT/VPpumKaGmMKyLiPh2Mh2Y=; b=HIvTOFMO8LEUgfg7vjeT0Rl4ei
	Ck427Xm3Wxp0q5hQReb/Tsh8xdjNbME4srCcyWZ+DGbr2PUxrPhWkU1L7qjRMR16pdox3/AnzTNm5
	Qp2Y5E8lFo7VsVnL0lkZt/RVkBHSK775wiMoWoA7/EYOkhNyWR05+gosCu/qQPReoHstjaWBx3D4u
	Gk4tSFQW+b2rtRdzcYUWNwQogpGREV3sDNMEojXkwak/ACIQgzGOoQmlNwlqFwgAubwjGF8vIKChc
	ArQcs5lCBh4ij/8sRjdBEuSpM+TCMYAA50IiM+iWnUaXY9PkmnWdv9aC5CjdBjWDaa0mBqV7gOasW
	kHPNhhEQ==;
Received: from mailer.gwdg.de ([134.76.10.26]:34890)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <simon.fischer@ipp.mpg.de>)
	id 1w9zzt-0044ej-2R;
	Tue, 07 Apr 2026 08:33:14 +0200
Received: from mbx19-sub-03.um.gwdg.de ([10.108.142.68] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <simon.fischer@ipp.mpg.de>)
	id 1w9zzu-000JlG-1l;
	Tue, 07 Apr 2026 08:33:14 +0200
Received: from MBX19-SUB-03.um.gwdg.de (10.108.142.68) by
 MBX19-SUB-03.um.gwdg.de (10.108.142.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 7 Apr 2026 08:33:14 +0200
Received: from MBX19-SUB-03.um.gwdg.de ([10.108.142.68]) by
 MBX19-SUB-03.um.gwdg.de ([10.108.142.68]) with mapi id 15.02.2562.037; Tue, 7
 Apr 2026 08:33:14 +0200
From: "Fischer, Simon" <simon.fischer@ipp.mpg.de>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: AW: Lowspeed USB device enumerationg under 5.4.288, but not under
 6.8.1
Thread-Topic: Lowspeed USB device enumerationg under 5.4.288, but not under
 6.8.1
Thread-Index: AdzCs+1oMfzeuAm2S72W6S8kW/Ma3P//7O4A//ikUdA=
Date: Tue, 7 Apr 2026 06:33:14 +0000
Message-ID: <dbb6846930a044558a52201d5d53a851@ipp.mpg.de>
References: <8a29db20f78046578e8dc2c516607240@ipp.mpg.de>
 <2026040255-zone-chamomile-964f@gregkh>
In-Reply-To: <2026040255-zone-chamomile-964f@gregkh>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Virus-Scanned: (clean) by clamav
X-Spam-Level: -

Dear Greg, dear all,

the same behaviour is still present with kernel 6.19.11

Anything else I can try/provide?

Thanks
Simon

-----Urspr=FCngliche Nachricht-----
Von: Greg KH <gregkh@linuxfoundation.org>=20
Gesendet: Donnerstag, 2. April 2026 18:10
An: Fischer, Simon <simon.fischer@ipp.mpg.de>
Cc: regressions@lists.linux.dev
Betreff: Re: Lowspeed USB device enumerationg under 5.4.288, but not under =
6.8.1

On Thu, Apr 02, 2026 at 03:34:35PM +0000, Fischer, Simon wrote:
> Dear list,
>=20
> I've tried to dig deeper into the issues, tried different quirks and smal=
l patches, but was unable to solve this or find the root cause. As this see=
ms to be a regression of 6.8 from 5.4, I hope this is the correct list?

6.8.1 is not supported by anyone but canonical, so there's not much we can =
do here, sorry as that is a very old and obsolete kernel missing tens of th=
ousands of changes.

Can you try running the latest 6.19 release instead?

thanks,

greg k-h
