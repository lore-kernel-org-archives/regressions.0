Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B11639849
	for <regressions@lists.linux.dev>; Mon, 20 Nov 2023 22:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thesusis.net
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by vps.thesusis.net (Postfix, from userid 1000)
	id 02882149C52; Mon, 20 Nov 2023 17:08:32 -0500 (EST)
From: Phillip Susi <phill@thesusis.net>
To: Christian =?utf-8?Q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Dave Airlie
 <airlied@gmail.com>, Linux regressions mailing list
 <regressions@lists.linux.dev>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Luben
 Tuikov <luben.tuikov@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: Radeon regression in 6.6 kernel
In-Reply-To: <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
Date: Mon, 20 Nov 2023 17:08:32 -0500
Message-ID: <87o7fojcwv.fsf@vps.thesusis.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com> writes:

> Well none of the commits mentioned can affect radeon in any way. Radeon=20
> simply doesn't use the scheduler.
>
> My suspicion is that the user is actually using amdgpu instead of=20
> radeon. The switch potentially occurred accidentally, for example by=20
> compiling amdgpu support for SI/CIK.

Indeed, the lspci I originally posted does indicate amdgpu.  What is the
difference and should I switch it?  If so, how?

> Those amdgpu problems for older ASIC have already been worked on and=20
> should be fixed by now.

I just pulled v6.7-rc2 and it's still broken.  I'll see if I can revert
those 3 patches.
