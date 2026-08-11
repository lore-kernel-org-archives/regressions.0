Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7DE3B19B9;
	Tue, 11 Aug 2026 07:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786434582; cv=none; b=qOKf//sOt2/FkjRGgVpTAgb0NjZ36Rgfn4ddnVdcUKLSa3mtFAdhiFkUcA6RF1AawqpQVDY7U5c2ntuIRlfOmg2UTxGkig981xuBbcUPOMdElD+nvcdpS8uwfkt1MzwLgl988lVcS3t5oxnE6Ku2l6SHxeuV6Qanzy2KIqBvcgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786434582; c=relaxed/simple;
	bh=Hx9xtnhr8kBwmqFDt5qP8gaHBwNvZMrsamwk/lVcQ7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j1iRMZgLx7MKkiISCQhDW4YFh2i4LWYGk1cNRpCkBbseaaIc2FfeO7Vj4/edGk/4teY88HYoTnlRrQuDHs3MbLkTkPdymssGG5c9JyJ6CTJIMY907hHHUS2jJ4eu9bZK7Y4a0nv9oXzwBHcio0EAsNIkP0jWB/1HhWux4hmgxpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=cyUgvD/m; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="cyUgvD/m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=4DJzo5COey13Dn5ANrWbZ1iE0e1NUUeeF45LhlAujg4=; b=cyUgvD/maIBhij+vR77ntQ6pUX
	ldzrKYZdtAcGqzt4axERrxxPO2sFsaDEim4GNFy3Lc6eQGJ2KvqVujnPe1OOLHG5bqblR9ov/uHI0
	a+3ZhOPTYea8ao7y1kpNr0vqZDH9rZWVu5x0PZIe94X3hY7AhyMomu/JX7nTtWxTU13wvJqe9FRLW
	L1xXFOwe3kvHKVBHfjGKC/l54AU8udNO3UQkS8PWK8QPJmUgEX0a44aguMjD9ZQRC/ORbXDynaJAA
	9dpjdqpNQipgpFfZouKISMIVIet0ElmT8HRGZiA6TGlOPyMJToGra5Dkm6uGdAtdtI01V1P3Kp/cz
	K67C6IUA==;
Received: from [90.249.211.112] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wthEV-00GxYo-Py; Tue, 11 Aug 2026 09:49:11 +0200
Message-ID: <3e3ae169-6313-42dc-b82d-cfaf85370aa7@igalia.com>
Date: Tue, 11 Aug 2026 08:49:10 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] drm/sched: FAIR policy causes serious performance
 degradation at max GPU load on 9070XT
To: Luke.Wildhardt@proton.me
Cc: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@mailbox.org>,
 phasta@kernel.org, "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <TfhgV1W0W5LI6RWUO6J35B3R8QIYH_FN3Eihzdo_9PH39hfn1AVByT-QBPHmWiAR-L0Kqi2sppM_EhFPKwZPGmb5pFgpF2MrzeFzkZDmpG8=@proton.me>
 <cef49cf329737e0af12ef5a90dd21f31e113d4c3.camel@mailbox.org>
 <DKL9VAWD2Y98.RBQPQUL7Y47F@kernel.org>
 <6e2a207e-4db6-4d47-b1f6-9cb13b8d6eeb@igalia.com>
 <enK0t0JrZ3lr9gmgPwE_YaVJDy7K355Bs0xy0YNoVwujLHCGWNRXCjDOhYfiHNGN3pPDSlEUIz3_UkXmFNAJNXxrJOIwvzAG-k8_p_D5FOQ=@proton.me>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <enK0t0JrZ3lr9gmgPwE_YaVJDy7K355Bs0xy0YNoVwujLHCGWNRXCjDOhYfiHNGN3pPDSlEUIz3_UkXmFNAJNXxrJOIwvzAG-k8_p_D5FOQ=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/08/2026 17:40, Luke.Wildhardt@proton.me wrote:
> Oops, forgot to reply all in my last message.
> 
> I did a quick test of the patch before I left this morning, the freezing seems to gone, but when the GPU is under the same condition, the stuttering is more uniform if that makes sense. Granted this was only a 5 minute test but the freeze was rather reliable before, I can do more testing later.
> 
> I know these things can be hard to describe, if that helps. If there's any profiling I could do or detailed logging that would help don't hesitate to ask.

I am assuming this more uniform stuttering is something not present with 
FIFO? Would it be possible to make two short videos, one before the 
regression kicks in, and one after. And for both cases a snapshot of 
gputop (from igt-gpu-tools) output before and after.

Regards,

Tvrtko

> -------- Original Message --------
> On Monday, 08/10/26 at 06:48 Tvrtko Ursulin <tvrtko.ursulin@igalia.com> wrote:
> 
> On 10/08/2026 13:45, Danilo Krummrich wrote:
>> On Mon Aug 10, 2026 at 10:28 AM CEST, Philipp Stanner wrote:
>>>> Reverted Commits:
>>>>
>>>> d09339388b77 drm/sched: Remove drm_sched_init_args->num_rqs
>>>> 2833a0512b4c drm/sched: Remove drm_sched_init_args->num_rqs usage
>>>> 16e7698bc04d drm/sched: Embed run queue singleton into the scheduler
>>>> 77a6809f1dc3 drm/sched: Remove FIFO and RR and simplify to a single run queue
>>>> 45c211ddf92a drm/sched: Switch default policy to fair
>>>> 2462a0ce23b0 drm/amdgpu: Remove drm_sched_init_args->num_rqs usage
>>
>> [...]
>>
>>> That might be the wisest thing to do; but let's hear if Tvrtko has an idea for
>>> a hotfix first.
>>
>> -rc7 was released yesterday; even with a working hotfix today it'd be tricky to
>> ensure the hotfix does not regress other drivers or workloads with 7.2 being
>> just a few days ahead.
>>
>> I suggest to not wait and get the reverts ready.
> 
> Yes reverts would be safer. I have them in a branch at
> people.freedesktop.org/~tursulin/drm-intel drm-sched-fair-reverts,
> mostly straightforward apart from one easy conflict in
> amdgpu_xcp_release_sched. Smoke tested on Steam Deck looks fine.
> 
> Having said that, the fix for min_vruntime handling I provided earlier
> in the thread also looks fine in my testing and is simple. No
> regressions found with synthetic unit test workloads or messing around
> on the Steam Deck. But we need to wait to hear from Luke since I haven't
> been able to repro his report locally yet.
> 
> Regards,
> 
> Tvrtko
> 
> 

