Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9382C1F1932;
	Tue, 13 May 2025 14:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747145245; cv=pass; b=aHJh5/qmYR6ZgK29gjoSMnK/FTXOTC29+kwbUtWLJ5O4VNnHX6r6LoPa1h9lQI1HbG4BH9SYzMk6uPcdop6cUT8/uqpkST170noV8UEM5r3Hl78mCXuowh0+tNG6GCiX719znvsxGMapPYD4xMAShSjdQ9ECMuhrOJTWFLqutzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747145245; c=relaxed/simple;
	bh=JMnhafDHoTwNojWYtsGqZCdcP8HOmyXxv6L4wZ3tmas=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=YD52fRQ1upZLKQlC9c6O7Pfpqp94/fmauX5PCTAsZDR3h0jW81TiIF6GFk9HnFShUzWqmUn2DqnLzpTxdQ5CSjSAYBAC4ltA+x93KaPZAT5N965A2AAfvdJ6fKcmIo8cAK9e258NkUN8Ii7aB4qghn+FJdSxHWtXG5Kn2rlBclE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=T/eV9MUk; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="T/eV9MUk"
ARC-Seal: i=1; a=rsa-sha256; t=1747145236; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fUZQqOw15+k3EYND81urxVYI+qDoqV3uUcIAKKIGU1coKEbQ9JwhyRjdc+9eGwL+qceXOgHoVBIHZoYeVLyLmiy6JPAF6c8wMzt6tUrxPdiaPidegnrBrX12CdE4T4+906+j3XnSxPAXr22rsHvWyDkepnrf01Wfdb+xG6q42kw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747145236; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cYCQebhW6q9EyNCmDn9FP5LnpX2mouYIT3HEsOgT72E=; 
	b=d9W+Tpf5SvsihkIiT1cWy/Oy2+iH3zc24sKbVa5KBxAIxmfe1vjm8uXutfn8Gz+UeQhgxw9pC6XbrrwJlvMN9hTxwFLu1Um16HYMPMdlPKL2ScM6dH74Lr9a/DOgKniIV+btQesb5Xd6a9Y+atlAVtyUXzacMDP2ANeFhkLg110=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747145236;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cYCQebhW6q9EyNCmDn9FP5LnpX2mouYIT3HEsOgT72E=;
	b=T/eV9MUkzQuYWYZTUj2PlTx0I82U8mwztzCrPq8xCCU2wSygdTd+Mv+i2FzF/6Ur
	6lACyC5s11kPl7HGJL2i91XZl3gP3HIAbY4JL9nLdfPzJqJKTg+f0g/iKB9bzbTzkwV
	TkyAzBwwrcSK5H/JcCNZyinkq5jrKFZs3Qp5mOCc=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1747145234407342.6788646952698; Tue, 13 May 2025 07:07:14 -0700 (PDT)
Date: Tue, 13 May 2025 11:07:14 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Christian Heusel" <christian@heusel.eu>
Cc: "kernelci" <kernelci@lists.linux.dev>,
	"kernelci-results" <kernelci-results@groups.io>,
	"regressions" <regressions@lists.linux.dev>,
	"marcelo.santos" <marcelo.santos@profusion.mobi>
Message-ID: <196c9f897c8.f3ba9f462747628.3709906537041426345@collabora.com>
In-Reply-To: <37715c79-bac0-435d-822d-6956036cb454@heusel.eu>
References: <CAMVAkEvhR+Z28zhxBvnQ64VmXYuP0ZvFg_14e2VuFPQDEpSa+g@mail.gmail.com> <37715c79-bac0-435d-822d-6956036cb454@heusel.eu>
Subject: Re: [REGRESSION] next/master: (build) implicit truncation from
 'int' to bit-field changes value from -1 ...
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hi Christian,

We are sorry about that. As part of the work on the new KernelCI system, we=
 have been
 growing our notifications system in the past few weeks.
Unfortunatelly this duplication was caused by a mistake during the developm=
ent process.
These should happen rarely. We apologize.

Best,

- Gus

--
Gustavo Padovan

Collabora Ltd.



---- On Tue, 13 May 2025 10:37:52 -0300 Christian Heusel <christian@heusel.=
eu> wrote ---

 > On 25/05/13 01:26PM, marcelo.santos@profusion.mobi wrote:=20
 > > Hello,=20
 > =20
 > Hello =F0=9F=91=8B=20
 > =20
 > > New build issue found on next/master:=20
 > >=20
 > > ---=20
 > >  implicit truncation from 'int' to bit-field changes value from -1 to=
=20
 > > 15 [-Werror,-Wbitfield-constant-conversion] in=20
 > > drivers/net/wireless/intel/iwlwifi/pcie/drv.o=20
 > > (drivers/net/wireless/intel/iwlwifi/pcie/drv.c)=20
 > > [logspec:kbuild,kbuild.compiler.error]=20
 > > ---=20
 > =20
 > I'm a bit confused, this seems to be the same report as sent our by the=
=20
 > KernelCI bot, who sent this out just a few minutes ago:=20
 > https://lore.kernel.org/all/CACo-S-0GVFPOW60XRF89kE-hgoLLJku5BiiqLPt3yXz=
tYMpwxw@mail.gmail.com=20
 > =20
 > Cheers,=20
 > Chris=20
 >=20

