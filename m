Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF7FFC1F
	for <regressions@lists.linux.dev>; Fri, 26 Jul 2024 20:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722026151; cv=none; b=k9alo9JBrloPLBK9T6bha2eo48KBN4HiydqLXUGC9vKusR4WsILxnxXBnVjYCOky6Bo0sFtO/UTJ631keDzkjjtd++213CDsYKp0netoIH4m+yYoAmqRf7BaXaU/j5C3VJexoNcKy6VKhV2AIcLvQL4y8pyMK59hEY72UXfCFX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722026151; c=relaxed/simple;
	bh=5cpj2T9MtM9S7w9oSBvF5nG7t0RJZ5T+iBjdV5pBSKI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lCuqSY+fVM+llC7VawEiIvpCaCDuB6cNfEq+OKHCl9kxTT2QSkukPk/4e4fZySXszYE4Gu49RVPSdRAfXUg2GHEz1i02dNmJwgTkoCrNWisaZT2z0AlXJ8Rib9zq2Bc2LnuzKsMQMejKZA/1WnA8jKsRRDc8n1kTf0sXFdv1Tr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TSLCSA+L; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Eua+zY1A; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TSLCSA+L";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Eua+zY1A"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722026148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5cpj2T9MtM9S7w9oSBvF5nG7t0RJZ5T+iBjdV5pBSKI=;
	b=TSLCSA+L8V3f8j3JQkqAWLfQonkWLNv2+TxZ2gHd4CYTtAujuSmAlcaGTCMXldIjWrYVGe
	7GJ/zA25xrNEx/lpEIalCvsUkLdrO+uMyfkCaHCHB1TmX8kxmbYIKq9vhBXHuZaI1uTpdq
	/ut7JWE3s1vYmuemRY3eJHD0RzQ/E3sE2RJMu7ldxy+iQ6NcDMcDtmiYfe0cikftwlPffp
	+rNYfBtZ219858RknWYg90fRqRWzOFg7wQEXbM21aRTw8X9BwuJBqS5nw5TIr3mJ7gTKqE
	BVoeRqqcFLTQ84Hu/ujckPGlPvngNzv1mORXnUpJTolqx9EIhvt4fthb3sPTFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722026148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5cpj2T9MtM9S7w9oSBvF5nG7t0RJZ5T+iBjdV5pBSKI=;
	b=Eua+zY1AGjRPvpL8yzeoNGIK25gltDuAfOj1VGMuGVjukXe4Ldgy1D6bvdv4cy3EyyeWIA
	SNcLktBMpluamJDw==
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, linuxarm@huawei.com,
 rafael.j.wysocki@intel.com, guohanjun@huawei.com, gshan@redhat.com,
 miguel.luis@oracle.com, catalin.marinas@arm.com, Linux List Kernel
 Mailing <linux-kernel@vger.kernel.org>, Linux regressions mailing list
 <regressions@lists.linux.dev>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, "Bowman, Terry"
 <Terry.bowman@amd.com>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>
Subject: Re: 6.11/regression/bisected - The commit c1385c1f0ba3 caused a new
 possible recursive locking detected warning at computer boot.
In-Reply-To: <20240726190119.00002557@Huawei.com>
References: <CABXGCsPvqBfL5hQDOARwfqasLRJ_eNPBbCngZ257HOe=xbWDkA@mail.gmail.com>
 <20240723112456.000053b3@Huawei.com> <20240723181728.000026b3@huawei.com>
 <20240725181354.000040bf@huawei.com> <87le1ounl2.ffs@tglx>
 <20240726181424.000039a4@Huawei.com> <20240726190119.00002557@Huawei.com>
Date: Fri, 26 Jul 2024 22:35:47 +0200
Message-ID: <878qxnvql8.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jul 26 2024 at 19:01, Jonathan Cameron wrote:
> I tested it on an emulated setup with your changes on top of
> mainline as of today and the issue is resolved.
>
> Would you mind posting a formal patch? Or I can do it on Monday if that's
> easier for you.

Go for it. I have enough stuff on my plate to deal with :)

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
