Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D029915494
	for <regressions@lists.linux.dev>; Mon,  5 Jun 2023 10:27:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B40AD152B;
	Mon,  5 Jun 2023 03:28:00 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.24.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 474AA3F793;
	Mon,  5 Jun 2023 03:27:13 -0700 (PDT)
Date: Mon, 5 Jun 2023 11:27:10 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ravi Bangoria <ravi.bangoria@amd.com>, jolsa@kernel.org,
	irogers@google.com, bp@alien8.de, adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION][BISECT] perf/core: Remove pmu linear searching code
Message-ID: <ZH24fi8MWALIV72Z@FVFF77S0Q05N>
References: <3abd3693-ad87-9abf-a762-337076638fcc@linaro.org>
 <ZH2KVyyC5oMr+Vk2@FVFF77S0Q05N>
 <20230605092731.GZ4253@hirez.programming.kicks-ass.net>
 <20230605101401.GL38236@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605101401.GL38236@hirez.programming.kicks-ass.net>

On Mon, Jun 05, 2023 at 12:14:01PM +0200, Peter Zijlstra wrote:
> On Mon, Jun 05, 2023 at 11:27:31AM +0200, Peter Zijlstra wrote:
> 
> > That said; given that this commit has been tagged twice now, I suppose I
> > should go revert it and we'll try again after a more thorough audit.
> 
> I'll go queue this then...
> 
> ---
> Subject: perf: Re-instate the linear PMU search
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Mon Jun  5 11:42:39 CEST 2023
> 
> Full revert of commit 9551fbb64d09 ("perf/core: Remove pmu linear
> searching code").
> 
> Some architectures (notably arm/arm64) still relied on the linear
> search in order to find the PMU that consumes
> PERF_TYPE_{HARDWARE,HW_CACHE,RAW}.
> 
> This will need a more thorought audit and clean.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Thanks for sorting this out!

Mark.

> ---
>  kernel/events/core.c |   39 +++++++++++++++++++++++++--------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
> 
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -11630,27 +11630,38 @@ static struct pmu *perf_init_event(struc
>  	}
>  
>  again:
> -	ret = -ENOENT;
>  	rcu_read_lock();
>  	pmu = idr_find(&pmu_idr, type);
>  	rcu_read_unlock();
> -	if (!pmu)
> -		goto fail;
> +	if (pmu) {
> +		if (event->attr.type != type && type != PERF_TYPE_RAW &&
> +		    !(pmu->capabilities & PERF_PMU_CAP_EXTENDED_HW_TYPE))
> +			goto fail;
> +
> +		ret = perf_try_init_event(pmu, event);
> +		if (ret == -ENOENT && event->attr.type != type && !extended_type) {
> +			type = event->attr.type;
> +			goto again;
> +		}
>  
> -	if (event->attr.type != type && type != PERF_TYPE_RAW &&
> -	    !(pmu->capabilities & PERF_PMU_CAP_EXTENDED_HW_TYPE))
> -		goto fail;
> -
> -	ret = perf_try_init_event(pmu, event);
> -	if (ret == -ENOENT && event->attr.type != type && !extended_type) {
> -		type = event->attr.type;
> -		goto again;
> +		if (ret)
> +			pmu = ERR_PTR(ret);
> +
> +		goto unlock;
>  	}
>  
> +	list_for_each_entry_rcu(pmu, &pmus, entry, lockdep_is_held(&pmus_srcu)) {
> +		ret = perf_try_init_event(pmu, event);
> +		if (!ret)
> +			goto unlock;
> +
> +		if (ret != -ENOENT) {
> +			pmu = ERR_PTR(ret);
> +			goto unlock;
> +		}
> +	}
>  fail:
> -	if (ret)
> -		pmu = ERR_PTR(ret);
> -
> +	pmu = ERR_PTR(-ENOENT);
>  unlock:
>  	srcu_read_unlock(&pmus_srcu, idx);
>  
