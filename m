Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6808455173
	for <regressions@lists.linux.dev>; Wed, 16 Sep 2026 07:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544273; cv=none; b=O064CbNCcfqbs78adS6dHZFzWTSIkP77IrJdlX3d42jc+3PsovDZ/tPz1MWt70BUYqBv6uWs5w5uCCsHOpT8M0JQzyfxfjWQlnWrwUWmyyX0nozcSy3SJqMpfmXf0BMPVz75G88BHnu1kpxs+6dcIRxDDhgBI7C6PguE3KCFVXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544273; c=relaxed/simple;
	bh=GDtzL67scSq2UWnFotGDkOZ3m1EtjuZAhaUshRza66s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WMJai4Saf4gJOkW3uS4s4kMwuuPR7VEwUcZSpwITCN+WsLZJ7akfs2knKK7aCL/mr1FWnDVrMN53VfRKa5O5/DZgak48XCykZns3sLwexZ4pRZij5Qsv3jMUIXYuFq79dvcE9e0fLf8UlVHFtBMWAbEpD/rhs8QLKIn8+FWO9W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=siM4TMnc; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="siM4TMnc"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hl9hh5XVyz8ty1;
	Wed, 16 Sep 2026 09:37:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789544260; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GDtzL67scSq2UWnFotGDkOZ3m1EtjuZAhaUshRza66s=;
	b=siM4TMnch2rn4U1j6hPM6Y+Jrosea3tVMCzDOpwciv+u9hM/WtCLYH/76ONpw67XdtlStN
	R8kouwYNsLsggAhrLqD4C0+4IVH+Fh2wfBb6qjM17f+S/a+Nyo1B28TuvNAbt0X1hUoTSh
	BAAAxddN/HeS4UuSn3vdf8CpMUka9TSEAzC85DX28ZqI3MFJ5pHCGE5mXXU2uWU0mdnR7/
	mVGIVF+9UO3fCdgsSoTxdYBIwRsy6cOv9NTjnA3k70WBpgJnXXqrY8qNqpMAg6/erHcxlm
	qOiZgZaUG6GVqbXwV689je8/JWmbrGG1LJlbsVHr1FQVns0/UHYJdpr3QXMhSA==
Message-ID: <763ba7b5895ac8f850662eaad84a2d5b523a8902.camel@mailbox.org>
Subject: Re: [REGRESSION] drm/sched: FAIR policy causes serious performance
 degradation at max GPU load on 9070XT
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
	Luke.Wildhardt@proton.me
Cc: Danilo Krummrich <dakr@kernel.org>, "matthew.brost@intel.com"
	 <matthew.brost@intel.com>, "ckoenig.leichtzumerken@gmail.com"
	 <ckoenig.leichtzumerken@gmail.com>, "dri-devel@lists.freedesktop.org"
	 <dri-devel@lists.freedesktop.org>, "regressions@lists.linux.dev"
	 <regressions@lists.linux.dev>, "amd-gfx@lists.freedesktop.org"
	 <amd-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Wed, 16 Sep 2026 09:37:34 +0200
In-Reply-To: <ab60bdb4-351f-4911-9246-2719d078cb96@igalia.com>
References:
		 	<TfhgV1W0W5LI6RWUO6J35B3R8QIYH_FN3Eihzdo_9PH39hfn1AVByT-QBPHmWiAR-L0Kqi2sppM_EhFPKwZPGmb5pFgpF2MrzeFzkZDmpG8=@proton.me>
			 <cef49cf329737e0af12ef5a90dd21f31e113d4c3.camel@mailbox.org>
			 <DKL9VAWD2Y98.RBQPQUL7Y47F@kernel.org>
			 <6e2a207e-4db6-4d47-b1f6-9cb13b8d6eeb@igalia.com>
			 <enK0t0JrZ3lr9gmgPwE_YaVJDy7K355Bs0xy0YNoVwujLHCGWNRXCjDOhYfiHNGN3pPDSlEUIz3_UkXmFNAJNXxrJOIwvzAG-k8_p_D5FOQ=@proton.me>
			 <4OmZej9WiJ6-rsJ_lFcrmwtClAwMdN4oHXWH0p8FkIrhAn4LKS4O3q36wrdZrvjZHBNS8PZsvaIvR-1aFZfF2tDiy1cdMzTYNylcbGDQN68=@proton.me>
			 <a9ee4edb-e763-4fd7-a510-32191df0cf8f@igalia.com>
			 <932892b196f7bbba7f5e9bff22f9b484854aaccc.camel@mailbox.org>
			 <ab60bdb4-351f-4911-9246-2719d078cb96@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MBO-RS-META: t7tj41edfc77zcym3yib1pm5n7ffxnii
X-MBO-RS-ID: 134a4ce73af47e1eb91

On Wed, 2026-08-12 at 13:29 +0100, Tvrtko Ursulin wrote:
> Not sure if you are calling me out here or not, since apart from a=20
> direct mention, the lore link above is also a reply to my email, so for=
=20
> the record, I did give my ack for those patches. Plus I spent time=20
> testing them. So if you were in fact calling me out, I don't see how=20
> that is warranted. And on the wider topic I also never shied away from=
=20
> the non-glamorous work.

I was addressing what I perceive to be the general problems within DRM
=E2=80=93 I still believe the general points are valid, but want to stress =
that
it's a collective problem in which we all play a role, though no one is
the protagonist. I mentioned the media outlet (which quoted your name)
as part of the problem because there are external cheerleaders for
performance (whose unconditional priority is *the* reason for the
design mistakes in drm_sched) and features.

Nevertheless, I apologize for the rough tone and want to emphasize that
you're indeed the most engaged contributor and have improved many
things. The unit tests alone are worth their weight in silver.

The wider, problematic patterns in DRM might be worth addressing with
the appropriate tenderness in a suitable format; I will try to collect
my thoughts on that.


Regards,
Philipp
