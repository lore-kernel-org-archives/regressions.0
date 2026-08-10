Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF6E3D952D;
	Mon, 10 Aug 2026 12:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786365925; cv=none; b=IfCPKEbEKQlUtPH4OALCxtLvhAcmcQJaKdHskCdPXfQ4CI/6h6tDJvxR+7g11NxLUpsKoQDws2LKtt9BSy9MOmd8l67RvO8hAZ8KZqbJvky5aC4oJfdARCP9f/pHn74V3RC8EcNe73qnatVDg0OzK+K82WDVqsYzCxxwa2GuUss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786365925; c=relaxed/simple;
	bh=4K2C7DhbJOJxmf8+UuSZg6NFnK7PTCnLVHe4kYu+6Zw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=mzdyPyqwCgzALo1QqikB0JirCX93ZR/2aTZWLfUxBHl1AKff8yntDXEZOo3iR1EMnIBXAchygMIhSA3F3ZhH1WT+sVnd3117Ss/xWhpRh/cOhP/a0V8Z3yg8oxKxPvKTvWnHNU9Ts1m56pVsd+IV1OkzETgGv/UTKO3kHcb0aXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TuPq1NID; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TuPq1NID"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556261F00A3D;
	Mon, 10 Aug 2026 12:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786365924;
	bh=4K2C7DhbJOJxmf8+UuSZg6NFnK7PTCnLVHe4kYu+6Zw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=TuPq1NIDM0pLQYZyikjmMRc68yoxpEgRFj7gmpdP8TIYNF7LpdYSIEySNU6fPL0G5
	 4dSoeNoQLuM7Z6zepMectNNYWu1E2/l4wAuZZa5CmSrlSAu+kGVRK52Iz5NlTDXQ3H
	 pKRTJcpQ/5iZ72WVUHJCl++lTfo73s7ZchZV4iQ4rpg72kMTYMdZi6U2QH7Vcii3zV
	 /tdDZD7X1AiFT8jImaqUN41ahlgBQYeMgt2OnRYHFrgdc5fC8KHWauHZQB+lcUMRip
	 WsifvbWv1j45wXOb/Hz0QNA9IRWmQPR3Cv2F8QhdxB9oRv0ifRE8q9vh64g0j4GOfc
	 uvF1UgUH1HfGg==
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Aug 2026 14:45:20 +0200
Message-Id: <DKL9VAWD2Y98.RBQPQUL7Y47F@kernel.org>
Subject: Re: [REGRESSION] drm/sched: FAIR policy causes serious performance
 degradation at max GPU load on 9070XT
Cc: <phasta@kernel.org>, <Luke.Wildhardt@proton.me>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>
To: "Philipp Stanner" <phasta@mailbox.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <TfhgV1W0W5LI6RWUO6J35B3R8QIYH_FN3Eihzdo_9PH39hfn1AVByT-QBPHmWiAR-L0Kqi2sppM_EhFPKwZPGmb5pFgpF2MrzeFzkZDmpG8=@proton.me> <cef49cf329737e0af12ef5a90dd21f31e113d4c3.camel@mailbox.org>
In-Reply-To: <cef49cf329737e0af12ef5a90dd21f31e113d4c3.camel@mailbox.org>

On Mon Aug 10, 2026 at 10:28 AM CEST, Philipp Stanner wrote:
>> Reverted Commits:
>>=20
>> d09339388b77 drm/sched: Remove drm_sched_init_args->num_rqs
>> 2833a0512b4c drm/sched: Remove drm_sched_init_args->num_rqs usage
>> 16e7698bc04d drm/sched: Embed run queue singleton into the scheduler
>> 77a6809f1dc3 drm/sched: Remove FIFO and RR and simplify to a single run =
queue
>> 45c211ddf92a drm/sched: Switch default policy to fair
>> 2462a0ce23b0 drm/amdgpu: Remove drm_sched_init_args->num_rqs usage

[...]

> That might be the wisest thing to do; but let's hear if Tvrtko has an ide=
a for
> a hotfix first.

-rc7 was released yesterday; even with a working hotfix today it'd be trick=
y to
ensure the hotfix does not regress other drivers or workloads with 7.2 bein=
g
just a few days ahead.

I suggest to not wait and get the reverts ready.

Thanks,
Danilo
