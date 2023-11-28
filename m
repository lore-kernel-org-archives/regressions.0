Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173501100
	for <regressions@lists.linux.dev>; Tue, 28 Nov 2023 00:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="Pjq/Cf0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701133179;
	bh=C+WoRpLz4ShCJ4XjCw9fNycJzhe2kxDftUueiTVyaKs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Pjq/Cf0/z/HjG03/EP2bb0mnMNe51x2mxMm9n1J3jZOLtkfmLEZlIz3G4g1RDXuqm
	 Hgt/KkoMn7pdM75wkf8dhBPxAfcBVMo5VDTk61SsYvBiwsye/A+8DFpg2v7dKqhp5D
	 xBob1guuriG237cOzgfyBA2MfBV2KaUiO2qM3fY5TfGFmiArEBseknn7I/3/3O+iA5
	 a+637wNwjBm7OjYHztaCfl1O310XYvZ3Vuhf2ifBMtIhWKyZxyTtvNFqedI8FJ7drM
	 GQYd+1gw4+57gj2GUQVWYcaLmLSTjR8Bt6mtmykG5Cme7EHM6+8oQKOlagTaEuFksl
	 Ha1n9HqhtFK+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SfPHb32Qhz4wc8;
	Tue, 28 Nov 2023 11:59:39 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Timothy Pearson
 <tpearson@raptorengineering.com>
Cc: Jens Axboe <axboe@kernel.dk>, regressions <regressions@lists.linux.dev>,
 npiggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register save
In-Reply-To: <89de310e-bb9a-4485-bc8c-3fbefc90e6f6@csgroup.eu>
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com>
 <877cmc7ve9.fsf@mail.lhotse>
 <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com>
 <874jhg6lkn.fsf@mail.lhotse>
 <1294229534.48922001.1700539832331.JavaMail.zimbra@raptorengineeringinc.com>
 <87leaqjs8x.fsf@mail.lhotse>
 <1340817182.49635143.1700784119445.JavaMail.zimbra@raptorengineeringinc.com>
 <1276384468.50536225.1701110354677.JavaMail.zimbra@raptorengineeringinc.com>
 <89de310e-bb9a-4485-bc8c-3fbefc90e6f6@csgroup.eu>
Date: Tue, 28 Nov 2023 11:59:35 +1100
Message-ID: <871qca4rrc.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 27/11/2023 =C3=A0 19:39, Timothy Pearson a =C3=A9crit=C2=A0:
>> Just wanted to check back and see if this patch was going to be
>> queued up soon?  We're still having to work around / advertise the
>> data destruction issues the underlying bug is causing on e.g. Debian
>> Stable.
>
> Has any agreement been reach on the final solution ? Seeing the many=20
> discussion on patch v2 I had the feeling that it was not the final soluti=
on.

The actual patch is fine I think.

The discussion was about improving the explanation of exactly what's
happening in the change log, and whether there is a larger bug causing
FP corruption unrelated to io-uring.

I'm now reasonably confident there's no detectable corruption of fr0
happening except via the io-uring -> clone path.

It's still a bad bug for us to corrupt fr0 across sys_clone(), but in
practice it doesn't affect userspace because fr0 is volatile across
function calls.

cheers
