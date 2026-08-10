Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDF72DF3EA
	for <regressions@lists.linux.dev>; Mon, 10 Aug 2026 16:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380061; cv=none; b=QdYjPHoC3UYU9Fq9nl7MgDkaMBHuMyYHPpMH77DfXw77BDnbUupc2D+IzcF9w69yEvkgULiMVaKDs3VAgvgrNDhL/5cyXqgvCyIhKO1ZZRq331a176XypxTiu0dWbTkh8orGL9fdz9JapTXBQhIlYw1Q74l9rAq+e82mTxzwZHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380061; c=relaxed/simple;
	bh=O5jCfkoJY0H4PdQhix+wbkevzWgpLvmwylGYlo1nJ4U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WoUDpCwnNQhrYVLAq+7w65DhlY8/ruA7VKqigaOY3uwKxxPwV7DvHOktjZPrTkBHAPeZpT3a9nskTRUjHs+NMUqp2kmr9ME5RX9KlV/KCN2Ul36B/KlzJhDNdvz6qgFCaDhY46esjyHfFpF+78GIBwF5CZc685qWObtt5l7wXeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=FFJVgUKV; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="FFJVgUKV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1786380051; x=1786639251;
	bh=O5jCfkoJY0H4PdQhix+wbkevzWgpLvmwylGYlo1nJ4U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FFJVgUKVpAgNN4QiEV4aTabD26nDmpu7izKtqlAbAGe7PwC8W7l2rwjnCq7jI+bF7
	 5f2SDD1rn3oMtMnXWGxjxGC+M4n564ZjNPUmFpeRKlgTwgZ0THsBEncEX1J0v8+IIv
	 dZgvzf+jQfuRflWXBlzWwo2oSTzEpkxBJx/qwz+ZKoSOXrWL3RB7MHSu5OONTxlMbY
	 a0rp4L6mKiZ5/061FSMBQr9a8345xK9lwWp28QUpdLoexnEUBhzQfYu8MZZP43+P8b
	 alOo5ai1cYLGGRmjWl8Bm9i9hIQ1qI25B+yskNHpwWD3ycl/8eSQ6i3rIuSzI04p8s
	 PEl7bxHueo1Dw==
Date: Mon, 10 Aug 2026 16:40:43 +0000
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
From: Luke.Wildhardt@proton.me
Cc: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@mailbox.org>, phasta@kernel.org, "matthew.brost@intel.com" <matthew.brost@intel.com>, "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [REGRESSION] drm/sched: FAIR policy causes serious performance degradation at max GPU load on 9070XT
Message-ID: <enK0t0JrZ3lr9gmgPwE_YaVJDy7K355Bs0xy0YNoVwujLHCGWNRXCjDOhYfiHNGN3pPDSlEUIz3_UkXmFNAJNXxrJOIwvzAG-k8_p_D5FOQ=@proton.me>
In-Reply-To: <6e2a207e-4db6-4d47-b1f6-9cb13b8d6eeb@igalia.com>
References: <TfhgV1W0W5LI6RWUO6J35B3R8QIYH_FN3Eihzdo_9PH39hfn1AVByT-QBPHmWiAR-L0Kqi2sppM_EhFPKwZPGmb5pFgpF2MrzeFzkZDmpG8=@proton.me> <cef49cf329737e0af12ef5a90dd21f31e113d4c3.camel@mailbox.org> <DKL9VAWD2Y98.RBQPQUL7Y47F@kernel.org> <6e2a207e-4db6-4d47-b1f6-9cb13b8d6eeb@igalia.com>
Feedback-ID: 214028577:user:proton
X-Pm-Message-ID: 956e93293421320c46863540605e532c2bf0367a
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Oops, forgot to reply all in my last message.

I did a quick test of the patch before I left this morning, the freezing se=
ems to gone, but when the GPU is under the same condition, the stuttering i=
s more uniform if that makes sense. Granted this was only a 5 minute test b=
ut the freeze was rather reliable before, I can do more testing later.

I know these things can be hard to describe, if that helps. If there's any =
profiling I could do or detailed logging that would help don't hesitate to =
ask.



-------- Original Message --------
On Monday, 08/10/26 at 06:48 Tvrtko Ursulin <tvrtko.ursulin@igalia.com> wro=
te:

On 10/08/2026 13:45, Danilo Krummrich wrote:
> On Mon Aug 10, 2026 at 10:28 AM CEST, Philipp Stanner wrote:
>>> Reverted Commits:
>>>
>>> d09339388b77 drm/sched: Remove drm_sched_init_args->num_rqs
>>> 2833a0512b4c drm/sched: Remove drm_sched_init_args->num_rqs usage
>>> 16e7698bc04d drm/sched: Embed run queue singleton into the scheduler
>>> 77a6809f1dc3 drm/sched: Remove FIFO and RR and simplify to a single run=
 queue
>>> 45c211ddf92a drm/sched: Switch default policy to fair
>>> 2462a0ce23b0 drm/amdgpu: Remove drm_sched_init_args->num_rqs usage
>
> [...]
>
>> That might be the wisest thing to do; but let's hear if Tvrtko has an id=
ea for
>> a hotfix first.
>
> -rc7 was released yesterday; even with a working hotfix today it'd be tri=
cky to
> ensure the hotfix does not regress other drivers or workloads with 7.2 be=
ing
> just a few days ahead.
>
> I suggest to not wait and get the reverts ready.

Yes reverts would be safer. I have them in a branch at
people.freedesktop.org/~tursulin/drm-intel drm-sched-fair-reverts,
mostly straightforward apart from one easy conflict in
amdgpu_xcp_release_sched. Smoke tested on Steam Deck looks fine.

Having said that, the fix for min_vruntime handling I provided earlier
in the thread also looks fine in my testing and is simple. No
regressions found with synthetic unit test workloads or messing around
on the Steam Deck. But we need to wait to hear from Luke since I haven't
been able to repro his report locally yet.

Regards,

Tvrtko


