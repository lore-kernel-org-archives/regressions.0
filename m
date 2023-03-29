Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F16E6FA2
	for <regressions@lists.linux.dev>; Wed, 29 Mar 2023 19:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57875C433D2;
	Wed, 29 Mar 2023 19:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680117153;
	bh=IAbVbgzm8rotxtzqHo6+4J46rGYeg6Bl2004ztujgIc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UcfQrlGENm/cQxGlxvCq07gNrRDbcz34nlLVjZtX2OjdOa1JLwlE0uUCT+Fu0qQWx
	 oCPJAlCKP2ty1tCp/ZId1B2ztGJ//osrLFZItCqV8obg2o973NYV6DY2Gr/nESaDjU
	 559NTFb2ycfH291klaXymDBi+l1c9uCb4y1usfPySEG5Fyv5VOhF40g4FVv31r77u6
	 h8UcHH9mdPsfMODvDE27Z7qrpUdB/Sd5idaQjjmacE+TgblHZQ6VMqSKc1ctp8WElg
	 vHJwVu3hTr59fOIR3m6rbrcGi7LSrGhHepNtv7a/aNpDY70CTidCg1PPdUNgp9p48f
	 6Xo0MIlYHMxvg==
Date: Wed, 29 Mar 2023 12:12:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Sasha Neftin <sasha.neftin@intel.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Paul Menzel
 <pmenzel@molgen.mpg.de>, Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, netdev@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [Intel-wired-lan] [REGRESSION] e1000e probe/link detection
 fails since 6.2 kernel
Message-ID: <20230329121232.7873ad95@kernel.org>
In-Reply-To: <87a5zwosd7.wl-tiwai@suse.de>
References: <87jzz13v7i.wl-tiwai@suse.de>
	<652a9a96-f499-f31f-2a55-3c80b6ac9c75@molgen.mpg.de>
	<ZCP5jOTNypwG4xK6@debian.me>
	<87a5zwosd7.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 29 Mar 2023 10:48:36 +0200 Takashi Iwai wrote:
> On Wed, 29 Mar 2023 10:40:44 +0200,
> Bagas Sanjaya wrote:
> >=20
> > On Tue, Mar 28, 2023 at 04:39:01PM +0200, Paul Menzel wrote: =20
> > > Does openSUSE Tumbleweed make it easy to bisect the regression at lea=
st on
> > > =E2=80=9Crc level=E2=80=9D? It be great if narrow it more down, so we=
 know it for example
> > > regressed in 6.2-rc7.
> > >  =20
> >=20
> > Alternatively, can you do bisection using kernel sources from Linus's
> > tree (git required)? =20
>=20
> That'll be a last resort, if no one has idea at all :)

I had a quick look yesterday, there's only ~6 or so commits to e1000e.
Should be a fairly quick bisection, hopefully?

Adding Sasha.
