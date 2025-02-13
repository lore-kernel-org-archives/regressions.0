Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2AB2066D6
	for <regressions@lists.linux.dev>; Thu, 13 Feb 2025 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.109.42.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739441018; cv=none; b=UT5dnw8pEb3haQHDTBkFSVg9WKzRTgf3+UrTe4wXYZCZ2zbmoJr3mICeoOjpqvXBrAymgh2CuBOtXJYybECCv70Hu9AOdYSDH4uzTMKDQxAHNAwXYJqs8vKQR6L1C9ws0ASa/iMA4BsJ6oK8v/nouhb+YjCGqfaV9ofYWa7QoZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739441018; c=relaxed/simple;
	bh=3mmrcT8fzgw7TlxULAaBafEfw9AzLcjRzeJ53FOyfdQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PnePSi2aiVjcDeWFlql64+iGhNz6dPbtJiaylyCRciBXB4CqbKx+QVM8GvUgYlxvOmYXGQv+VtRPPCRqVtm1bgtU4Tn32SELFEswPA2JAtivbwISOrNTFdG6xOVU4fSR4oSe/cREAXff2fmzryUwYzOHjYrDx7AXtm5l/cPpOio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=faulbaum.in-berlin.de; spf=pass smtp.mailfrom=faulbaum.in-berlin.de; arc=none smtp.client-ip=192.109.42.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=faulbaum.in-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=faulbaum.in-berlin.de
X-Envelope-From: dieter@faulbaum.in-berlin.de
Received: from authenticated.user (localhost [127.0.0.1]) by einhorn.in-berlin.de  with ESMTPSA id 51D9utSe368111
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 10:56:55 +0100
Received: from frangula (frangula.xpertex.internal [172.16.3.241])
	by frangula.xpertex.internal (Postfix) with ESMTPSA id B91E613D;
	Thu, 13 Feb 2025 10:56:54 +0100 (CET)
From: Dieter Faulbaum <dieter@faulbaum.in-berlin.de>
To: Philip Yang <yangp@amd.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Philip Yang
 <Philip.Yang@amd.com>, amd-gfx@lists.freedesktop.org,
        Felix.Kuehling@amd.com, Alexander.Deucher@amd.com,
        christian.koenig@amd.com, regressions@lists.linux.dev
Subject: Re: [PATCH v2 4/9] drm/amdkfd: Validate user queue buffers
In-Reply-To: <315e27ab-f1d1-a681-a32f-1fc28cd81193@amd.com> (Philip Yang's
	message of "Wed, 12 Feb 2025 18:02:15 -0500")
References: <20240718210558.26340-1-Philip.Yang@amd.com>
	<20240718210558.26340-5-Philip.Yang@amd.com>
	<zpzehsckjz2bee6w5bsnfpmkvtlxf6jywijz7iroausghoh43i@nxr644rwjsb3>
	<315e27ab-f1d1-a681-a32f-1fc28cd81193@amd.com>
Date: Thu, 13 Feb 2025 10:56:54 +0100
Message-ID: <rie7c5u5frt.fsf@faulbaum.in-berlin.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable


Hello Philip,

Philip Yang <yangp@amd.com> writes:

> On 2025-02-12 17:42, Uwe Kleine-K=C3=B6nig wrote:
>
>  #regzbot introduced: 68e599db7a549f010a329515f3508d8a8c3467a4
> #regzbot monitor: https://bugs.debian.org/1093124
>
> Hello,
>
> On Thu, Jul 18, 2024 at 05:05:53PM -0400, Philip Yang wrote:
>
>  Find user queue rptr, ring buf, eop buffer and cwsr area BOs,=20
>  and
> check BOs are mapped on the GPU with correct size and take the=20
> BO
> reference.
>
> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
> Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
>
>
> This change made it into v6.12-rc1 as 68e599db7a54 ("drm/amdkfd:
> Validate user queue buffers"). A Debian user (Dieter Faulbaum,=20
> on Cc)
> reported that this change introduced a regression using a gfx803=20
> device
> resulting in a HSA exception when e.g. darktable is used. I=20
> didn't even
> try to understand the problem, but maybe one of you have an idea=20
> about
> the issue?!
>
> Try this patch
>
> https://lore.kernel.org/all/20250130000412.29812-1-Philip.Yang@amd.com/T/
Thank you, this patch helps!
Tested with kernel version 6.12.0+

And (for me) the Debian bug report could be closed.

Thanks to all for your help!
Dieter
