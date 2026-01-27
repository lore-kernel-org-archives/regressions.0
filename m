Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF783EBF05;
	Tue, 27 Jan 2026 07:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769497323; cv=none; b=tIUXP8AKB0d4uY4VP6/smp5GXU0VLK+ZoDkLdv4iu7mHUNrjWy328f1jD+c9m3h8PzG9IathX/0H3lJtIEbLeK4/Oas93+P2A2UKEFob9EWOxEvVxt3/NbvuUTQ4MJAu5mbn2zh6APdFn3/m2F76knRURJv82EtZodok73Ltirw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769497323; c=relaxed/simple;
	bh=E/eYheXWIcYmrXyOOF2pOYIDtvsZl08ZnA+sCoFz/7Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gq6hiZSHAEKLOWZzk8F9/8mBauRc/4QCTZ1QvOhvcNqp2NmSHuxcSIQK5zrUiBGD8Zdi3jftW3GHqzpXKivHFWmEx/5GOwTNSsLiPkWUtEP/knbg1PH7QkzCuIfkZRNyP3BxNOJP48f8BdB6aCEJn0eSpIus1DYluEdi/LEVP0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=U7MC0Eee; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="U7MC0Eee"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description;
	bh=E/eYheXWIcYmrXyOOF2pOYIDtvsZl08ZnA+sCoFz/7Y=; b=U7MC0EeeyatJCV4yWkPw0hKXNB
	mXO2Ofo0sddgWVbAc4w2tfSBHHCEdOzuH2WijgrlLIzBcVjbXWhFHHEvYEFEzgeX4NLMibAQq28ng
	ZtOZUFOWCP+OvlAbTeZIv23xJ0Z8hf9qujCT1eo8CmE0ejdkInGhrwT/51WrSnnZINoDPVD/FWL2x
	rq5txjppgBH5e/zaRq7qC1DD8lMl7kdoji0d60thsnfuNtmh/l2wPkS4zHucEuSa/wkDrApq5SLsF
	xar3VWMaz76M+qqbwZBX1HDKg+qs/e+m3TbELrH/3uiqJUWs8K3maT3YILWB5INpTrZEr29XuI4PR
	wzgOCLsw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <eppesuig@debian.org>)
	id 1vkd56-00GoQC-W4; Tue, 27 Jan 2026 07:01:45 +0000
Message-ID: <8f8a478ba50bd43d30704f0d74e02058810f2795.camel@debian.org>
Subject: Re: BUG: kernel NULL pointer dereference, address: 0000000000000000
From: Giuseppe Sacco <eppesuig@debian.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Salvatore Bonaccorso
	 <carnil@debian.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Sudip Mukherjee	
 <sudip.mukherjee@codethink.co.uk>, linux-kernel@vger.kernel.org, Andrew
 Morton	 <akpm@linux-foundation.org>, linux-mm@kvack.org,
 regressions@lists.linux.dev,  Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen	
 <dave.hansen@linux.intel.com>, x86@kernel.org, Hans de Goede
 <hansg@kernel.org>,  Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>
Date: Tue, 27 Jan 2026 08:01:43 +0100
In-Reply-To: <CADVatmNzTyUAr8UBvm6pHFsKz8xZpqUXh5NQR641JXsCWaPg8g@mail.gmail.com>
References: <6ba903ad-9897-42bb-8c2d-337385cc3746@molgen.mpg.de>
	 <db387081-345f-423a-a0ff-e13f3bec2d51@molgen.mpg.de>
	 <CADVatmM_mRnkDX=hpUjbyKkZnGynxJfRSujGxm2LaWWMEL_2ew@mail.gmail.com>
	 <ef9223ee-0a4e-468c-bfd0-0cf190d262f1@molgen.mpg.de>
	 <aVgjpWaIRkerdgCa@eldamar.lan>
	 <49cdd663-bcbd-48b4-ac38-77ce94ef0c8d@molgen.mpg.de>
	 <aVj-mz8vaw53TWtX@debian> <aXHeLGr1n-W-Ay44@eldamar.lan>
	 <CADVatmNzTyUAr8UBvm6pHFsKz8xZpqUXh5NQR641JXsCWaPg8g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Debian-User: eppesuig

Hello Sudip,

Il giorno lun, 26/01/2026 alle 18.56 +0000, Sudip Mukherjee ha scritto:
[...]
> I was going to post the patch today but since you have asked the
> reporter of the last bug to test it so lets wait for few more days.
>=20
> About the problem showing on the first boot, does that mean that its
> only seen on a cold boot ? and not seen on reboots (reboots without
> power cycle) ?
> Can it be reproduced if the system is powered-off and then powering
> it on ?

I am that reporter. The problem appeared only once, on a laptop that is
never just rebooted, i.e., it is always completely powered off and
started again after a few hours. I've built the kernel with your patch
but I would not use it until I would find a way to reproduce the error.
Sadly I was unable to see the problem again.

The only hint I may provide is that the day the problem showed up, I
was working in the wild, at about 10=C2=B0C. Maybe this has influenced the
hardware response timeing.

Bye,
Giuseppe
