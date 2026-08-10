Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F061131A55B;
	Mon, 10 Aug 2026 13:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786369716; cv=none; b=VHbdzfPTmrtu54o9BwILRDjQCTyPKJyudaSFpY0whZ/Rxmix8dM+oK0Sv/y1fnxW1WaxXKzvq5c2k/W5tjT9CYc5a3OlTQwVBQ1IyQd8V9WsbL5IKCPK9JkrE0RhEU0rEl/ZC8FLAxMb75lBIGRfEX62sIwvb9RanjS6s9CXYzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786369716; c=relaxed/simple;
	bh=2rjsRpVqGWeTZnqL+3TxS9BHs+JR+TE2l5VJxD6elv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KIJizI4N6DNm49WhIf8nnpck9Ta8Sr5xP9f4AGQsB06WjT6Q79NV1HgHOpKSIeKKCaw+i3TwBfk62TPLt5h/IHgK+ElbkNr2EYHOruPSIdNez5e1O19m5LPnpeA46CwPMgvjoGVAcjY6xA8sJeSoblFOQg+TPk5xUaKHAfSvTkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=kDxj9bqv; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="kDxj9bqv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=in27MSSbAxZbIP265QZdTG9n006Q7o8kcgCwAqziv7o=; b=kDxj9bqv56sC44wxqDOhy5+4UJ
	u4f0gXC49VMaN0nAVlLWBXBQFX1n+43xx194cnQeQX2in6Kp6KPjQg4xqcbkNKkvrzs5eUu2tGACt
	GrfpKcRnSuDcOlqZZZKXhKozFXe+hVuEzH3q5CIbKYf3YSDDqKkrikPkMYOZNrHh54XwviUvfCXPx
	vpSk41O3zgj8NQ2z17aYaW3SMZxz36qOOfB+9ANBO9NC51bAzZEWN+Ml5ibEB5BCq1XlpYQ6SmlYt
	A/a/A1YVcWhOR7kgwvDh/2vug6uDcGV1x4e9Ocijzq0EIHbPgkZKz0ti0VMm4CLzBQBWjoujTqMnX
	rffT9q8g==;
Received: from [90.249.211.112] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wtQMQ-00Gc30-Hh; Mon, 10 Aug 2026 15:48:14 +0200
Message-ID: <6e2a207e-4db6-4d47-b1f6-9cb13b8d6eeb@igalia.com>
Date: Mon, 10 Aug 2026 14:48:13 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] drm/sched: FAIR policy causes serious performance
 degradation at max GPU load on 9070XT
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Luke.Wildhardt@proton.me,
 "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <TfhgV1W0W5LI6RWUO6J35B3R8QIYH_FN3Eihzdo_9PH39hfn1AVByT-QBPHmWiAR-L0Kqi2sppM_EhFPKwZPGmb5pFgpF2MrzeFzkZDmpG8=@proton.me>
 <cef49cf329737e0af12ef5a90dd21f31e113d4c3.camel@mailbox.org>
 <DKL9VAWD2Y98.RBQPQUL7Y47F@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <DKL9VAWD2Y98.RBQPQUL7Y47F@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/08/2026 13:45, Danilo Krummrich wrote:
> On Mon Aug 10, 2026 at 10:28 AM CEST, Philipp Stanner wrote:
>>> Reverted Commits:
>>>
>>> d09339388b77 drm/sched: Remove drm_sched_init_args->num_rqs
>>> 2833a0512b4c drm/sched: Remove drm_sched_init_args->num_rqs usage
>>> 16e7698bc04d drm/sched: Embed run queue singleton into the scheduler
>>> 77a6809f1dc3 drm/sched: Remove FIFO and RR and simplify to a single run queue
>>> 45c211ddf92a drm/sched: Switch default policy to fair
>>> 2462a0ce23b0 drm/amdgpu: Remove drm_sched_init_args->num_rqs usage
> 
> [...]
> 
>> That might be the wisest thing to do; but let's hear if Tvrtko has an idea for
>> a hotfix first.
> 
> -rc7 was released yesterday; even with a working hotfix today it'd be tricky to
> ensure the hotfix does not regress other drivers or workloads with 7.2 being
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

