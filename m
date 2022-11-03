Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500F22F34
	for <regressions@lists.linux.dev>; Thu,  3 Nov 2022 12:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=c5YMV9yUNvIid7Fs8dSYFPL0djGzo2bChVrVUTEnC/4=; b=TaQlsQou6F9DUu+vSB9GMRqfQ7
	b8Zsl9kuEiSltVX+qU9sJc3EYv0YN8JUTOn1EHkSXSu0XvtFN3Uaiw3umC1qzHCL40hupSMSzhey+
	Dn7NRad7NQs+7J9fG7jyytdUjAPrbWZpPS5PAQghIQiilIOOYzVd29SH/i9K3HfKsF8IKXncdYoPD
	bnbqQ+nIPOZCslhIf1ZFMXTGx99qNreVpOq/J3CI3lOkQJP5ILV21VM60Ib+vYt6FWkDYNz2HKyiE
	q0G2IyTcRKaE8foUUQxxKWJVVZYn4aX2iR2YTRh6RFCNA9P4Xy1JpM6GkYzLyb7tMx3l91o5DIpgB
	mbIA8eVw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqZPW-008gCC-4Q; Thu, 03 Nov 2022 12:33:31 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1D33930012F;
	Thu,  3 Nov 2022 13:33:29 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id F14E62011672D; Thu,  3 Nov 2022 13:33:28 +0100 (CET)
Date: Thu, 3 Nov 2022 13:33:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ravi Bangoria <ravi.bangoria@amd.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
	linux-perf-users@vger.kernel.org,
	open list <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
	Stephane Eranian <eranian@google.com>,
	Sandipan Das <sandipan.das@amd.com>
Subject: Re: Perf: BUG: kernel NULL pointer dereference, address:
 0000000000000198
Message-ID: <Y2O1GDRrJqIu17vM@hirez.programming.kicks-ass.net>
References: <CA+G9fYtOP-spGS7gYyBB-8wpUDiKxd5e_Nk05J9gzWR_DLBeFA@mail.gmail.com>
 <4429582f-155a-04d2-d139-a834bb325612@amd.com>
 <d577887d-b86b-82be-8081-f7bebacd8067@amd.com>
 <5bec4620-2e2b-abe0-1e82-528c084d4d16@amd.com>
 <cb40c209-9c4c-f645-8454-bcd74cb72405@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb40c209-9c4c-f645-8454-bcd74cb72405@amd.com>

On Thu, Nov 03, 2022 at 05:15:30PM +0530, Ravi Bangoria wrote:

> Sorry was distracted a bit. So, this seems to be happening because of
> race between amd_pmu_enable_all() and perf event NMI. Something like:
> 
>   amd_pmu_enable_all()
>   {
>       if (!test_bit(idx, cpuc->active_mask))
> 
>   --->/* perf NMI entry */
>       ...
>       x86_pmu_stop() {
>           __clear_bit(hwc->idx, cpuc->active_mask);
>           cpuc->events[hwc->idx] = NULL;
>       }
>       ...
>   <---/* perf NMI exit */
> 
>       amd_pmu_enable_event(cpuc->events[idx]);
>   }

Hmm, do you have more information? Something like that would require
calling amd_pmu_enable_all() while it is already active -- and that
seems suspect at first glance.

That is, you shouldn't be getting an NMI for @idx before
amd_pmu_enable_event().
