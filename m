Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B152DF91
	for <regressions@lists.linux.dev>; Mon, 27 Nov 2023 23:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thesusis.net
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by vps.thesusis.net (Postfix, from userid 1000)
	id 64FAA14ACC1; Mon, 27 Nov 2023 18:24:53 -0500 (EST)
From: Phillip Susi <phill@thesusis.net>
To: Alex Deucher <alexdeucher@gmail.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>
Cc: Christian =?utf-8?Q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Dave Airlie
 <airlied@gmail.com>, Linux regressions mailing list
 <regressions@lists.linux.dev>, linux-kernel@vger.kernel.org,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, Luben
 Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org, Alex
 Deucher <alexander.deucher@amd.com>
Subject: Re: Radeon regression in 6.6 kernel
In-Reply-To: <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
 <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
 <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
Date: Mon, 27 Nov 2023 18:24:53 -0500
Message-ID: <87jzq2ixtm.fsf@vps.thesusis.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Alex Deucher <alexdeucher@gmail.com> writes:

>> In that case those are the already known problems with the scheduler
>> changes, aren't they?
>
> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Maybe I'm
> misunderstanding what the original report was actually testing.  If it
> was 6.7, then try reverting:
> 56e449603f0ac580700621a356d35d5716a62ce5
> b70438004a14f4d0f9890b3297cd66248728546c

At some point it was suggested that I file a gitlab issue, but I took
this to mean it was already known and being worked on.  -rc3 came out
today and still has the problem.  Is there a known issue I could track?

