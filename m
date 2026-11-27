Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795778359;
	b=BoLegatDX0d4MZm9XI/2OGKHn3ofPxpJiv98ZG7u8VEVAOPpM1q5+9Gth0jKKcI7D1Z5
	 lAszVIMVZa5XGCNvzHrj5pQ+1fT198cKUhEQN2ghpR7hmpS3ETQB4xfJEmzQ0OtVuFYQH
	 WVnrAHVsAS5F16XRnPamztRiAEEWEjzVapxPtqf9/NzQKfjib0bUARC/bldSPfCnx+W7p
	 WMeGhk1YWpKL8rHZdHE0fHQT/neLyBbCbEaUc+yGrVHD+s6Qzu/DartaoUx1hGNOgnI6w
	 +TZqUxqv1oqqs8kFwIKHEwWSwh6kplsFQzMcTQlDOx3X5NlyqUSXKgEj73GFHXOtmMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ebCQTirr/RMa87RwZQrIepGXAsVVAdAub3WA6HHl5Wg=;
	b=LZVOyQX9p0+Q+a1M5sLz6+KAQ3GjomRUtoSlr8j8UYgd6d+qx8B2iUnjBjTQzy77L5/O
	 lBD4rVQ2JKLvotTCa4+NlacCp76cKGWkt3HZAfkdUh6kslIa+jOK50QT7kK3mGIUE6SAz
	 FkPwFXky94JkrLbWtnNgwSmfiRxXtbzaOvSBJZMjt3pYAXetOU4AnwQmg7bYtedJ6HDd3
	 WnPp64ryrY9YaL2u/sDIYbT60WDExGbCBt912gOPtnGyZbuA//j7CaoNJL8rnmancPkaB
	 ZQnTExz6SfshVPBRVFaHXH/zdBdj+Dn5j02AydMQ8Y8pLZi1q7Exhxjf4MGD0uk55nA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ENUO72oS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B055606A31F
	for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 11:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B055606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ENUO72oS
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso10888166c88.1
        for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 03:19:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795778359; cv=none;
        d=google.com; s=arc-20260327;
        b=e/m45iS1Ju+e8lvfmyl/G4j7Wy61R5D5vl6eQLg77EEqWntm13HXVmRGvjEnpOXdQb
         9pmIYEclWiVGGoy8wwdYA3P2McKMc/9tRxvze1wEAJnGOEwKFFuDjJwQ1PZQwT+3rvyI
         0YGV9FDjI6+tBXvIk8Y2QYNzV3pNjGBPpbwJq8JK13NJII4vWIQ3f5dk3LPNe38Jw7X7
         ftDT8S/yDpaHQToDvrlht5LNI5oeiciipyNA1OnEYkMgDbprASjwjTGjcZstWf+TkSoD
         g4uB4vjtuSJ7zTyaet5Jun3aY3toLkvSzNc7I1rqgzv/OM0f9vr3pGJbBAYmx62yUtFk
         3brQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ebCQTirr/RMa87RwZQrIepGXAsVVAdAub3WA6HHl5Wg=;
        fh=uDU6GYU6RaI1as8ZXPLmpA+go4hCGXdsRxmkVg8ng4E=;
        b=Jq0XiKZj1AZS2zbu8diJFmbvblU5BqlKGOBGtqis9kX9u2vtlUtEVROOe2AqgXL7F6
         PBAXpkL9hr+eWreQJnkhLgU4Dw8lO3UotDWLI61RZapp1xddbSOL0Bh+GFGV3gLTATcQ
         uFw5zIcKqcOcDNHi+YzULlb05R1L4nQ8PlxVjFSKuxxew+WHmtJQA5dOHwzuSQ80iyOp
         9ZHDxq37CdBVzVB3VkUDvCQ1oGR/UBtx2Wk2yYn57SsVLn4Y0kBSDr+GsiJpCfdIfmAa
         OQqNEiFONOH0lmXgVue2kjm3cFokKkMNKMqKH8JAM1NhzNGqcEh20P1kXdi4sklk6J6F
         qK/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795778359; x=1796383159; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ebCQTirr/RMa87RwZQrIepGXAsVVAdAub3WA6HHl5Wg=;
        b=ENUO72oS5JBC7MO1Iis9enZjMb6b6irBqV0vuBmdGAMaUrfl/ttBcw03boMrqkyEms
         2szSet0dO29aiSsSQ0DTdRdeoXPdSBamB/cnfAb+58RSS2sEhomRvLGU0qSjGf7vEer2
         yRjiV2JGabqzC3kExTwICCNCdb0ENatvh1s+O4l630eaSxs8j9zSEpmloloHhE+Ss6um
         YEuqPBxoHiNS7H4NK/3fSrPUgfCt2zBdGy0Ox3O/Tcv6s+qH30MdE54yX6qU/IsqmUj/
         kcW9qyyQwLQPj4U1FDa9fWJuBl09qRVwCe+TwXBrkfcqWRZomw48kA/fXpw/dy3JZx01
         9Teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778359; x=1796383159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ebCQTirr/RMa87RwZQrIepGXAsVVAdAub3WA6HHl5Wg=;
        b=vu1ooe3secxS3wLpKkTIsR+XCWLrlPIJxgNRnBBSNkAgMx2Igp0SV1bBh5RuHtUbfW
         wCskb3Wl9xT77Bs35L3/kS7rtk+Kq4dm2LF2N8l+5zDOY0jkdWM5Wu4fylPCfdtSrG8r
         ImHV/ZLGfigg63AUtJlIw2jXmJRNFYLgJzgjGk5l4wPZLVEpWAmqrttTgBuareHh0MFV
         ZdBNK9P/83+87+DM+kmgERzo8x6JEuAdKcPWclPOdKYppYLI0nphRGg966qTW/xI7a1D
         5bU7gUtzMS8Gy2bRAoGqEKuY/j+Wox5uko50hIRHRvmP5SrLHQX1ZQqdZsEO9N7gY/GD
         +THw==
X-Forwarded-Encrypted: i=1; AL+hErG0T9pUKCJAsBFuKxta/7Pvjy9tVRa7Hl4OixmZwz7CW0UYGl3lY3u8ktUpaPs7ZXHjtl0FbDUk+mXrfw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9N729Uz0DLt/Ah9xl7DvOa7xOWQB+rQr8F25TubJhtl9VFAVsj
	z0BWkwwW2jQsDQYrukcxz4AzluqdnnaK4kMEWry+rPZkdz3V3vMAYIqkPZr/AyiVAbX147PfPCA
	ykGkA4XsLi9VMdE9zZ3pnN9KMxeVAaPEjxIfwqF7ojw==
X-Gm-Gg: AZFdTZeV6bCd04jEeNFctX53w3ubrba5gxNnzIaeA/TuSLhP2dpkBreZXKxcFRQIg3A
	DGcEwA/VwdMvtCtexICQ2WyUCjCdC6ydaBUTsxltvHmgHfyQcKe1C4em1/vqRU66ymo8o3Bcumr
	Vgwvt9SJLDh/oyRrIj9+gzEQu2l3gG7noHDvEnNzc98gaoOy5p01IWoDg+rlTE9nZzB97Vqc6U4
	6gLS1iLlDJXNeA5ZMJtnneBmvumR3DTKF6UkEdbCP/XZXAFmLaIaajn+SW0R0oJW0h4t0fTggOT
	lk4adxwCDqkoshTmBDoC2lOlG3IZvt2fuhKYUA1ctUhhZdqdFJXMEDmP8QHYEply/mR1Npjcw9w
	Za1JBJdEuIFIrTK2iPSKENdvVnJbbkBpxTO11tH+TV0vWFZ3CMUomY80sJRdlh+BvuJJLxA==
X-Received: by 2002:a05:7022:f907:b0:1b2:558a:d781 with SMTP id
 a92af1059eb24-1b5567b5788mr21084700c88.5.1795778358475; Fri, 27 Nov 2026
 03:19:18 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CY5P221MB09262B7D6A68954CC1B3199FBD442@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM>
 <awWOCejxtjP12xFX@gpd4> <ce38fb8b-94d7-48ba-93bb-3b72cfcb3e61@amd.com>
 <CAKfTPtCudy4NV8sU+JWE=dcJpbKd+LVNZPZztU_0nD1a04Ca9g@mail.gmail.com>
 <awa3/FFd4hAnvtxK@chenyu-dev> <CAKfTPtCukFOD6nKD6oDYvjEiXXUY5fHui4w6fgnhNw+jpE=0RA@mail.gmail.com>
 <awlJ2Fp94knZQDxS@chenyu-dev>
In-Reply-To: <awlJ2Fp94knZQDxS@chenyu-dev>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 27 Nov 2026 12:19:02 +0100
X-Gm-Features: Aa3M54rLY7meJTUxiuiAVZ-WXvi4iBohtbbKbIgcxe4lp41qaNcl0nayfYtJWgQ
Message-ID: <CAKfTPtAqP_U7MuX4ZsX+6uccdCPNSQ9hqBTX9MegF1hft2KUuQ@mail.gmail.com>
Subject: Re: [REGRESSION] sched/fair: SIS_UTIL limit in select_idle_capacity()
 leaves busy tasks on little CPUs while big CPUs are idle
To: Chen Yu <yu.c.chen@intel.com>
Cc: James Buck <jbuck2005.linux@outlook.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Andrea Righi <arighi@nvidia.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Valentin Schneider <vschneid@redhat.com>, Usama Arif <usama.arif@linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 27 Nov 2026 at 10:25, Chen Yu <yu.c.chen@intel.com> wrote:
>
> On Wed, Nov 25, 2026 at 03:27:46PM +0100, Vincent Guittot wrote:
> > On Wed, 25 Nov 2026 at 11:38, Chen Yu <yu.c.chen@intel.com> wrote:
> > >
> > > On Wed, Nov 25, 2026 at 08:51:39AM +0100, Vincent Guittot wrote:
> > > > On Wed, 25 Nov 2026 at 03:53, K Prateek Nayak <kprateek.nayak@amd.c=
om> wrote:
> > > > >
> > > > > Hello Andrea,
> > > > >
> > > > > On 11/24/2026 6:45 PM, Andrea Righi wrote:
> > > > > > Hi James,
> > > > > >
> > > > > > On Tue, Nov 24, 2026 at 11:56:52AM +0000, James Buck wrote:
> > > > > >> Hi,
> > > > > >>
> > > > > >> Since commit 61ea17a63719 ("sched/fair: Add SIS_UTIL support t=
o select_idle_capacity()"), first in v7.2, CPU-bound multi-threaded work on=
 my big.LITTLE arm64 board runs 12-19% slower than on v7.1 and earlier, bec=
ause waking threads are placed on idle little CPUs while idle big CPUs are =
never looked at.
> > > > > >>
> > > > > >> Turning SIS_UTIL off at runtime restores the old speed. select=
_idle_capacity() and update_idle_cpu_scan() are unchanged in v7.4-rc4, so I=
 expect mainline to behave the same.
> > > > > >
> > > > > > A related regression from the same commit was reported by Usama=
 here:
> > > > > > https://lore.kernel.org/r/20261113153157.2495664-1-usama.arif@l=
inux.dev/
> > > > > >
> > > > > > On Grace, a zero SIS_UTIL budget skips the search despite suita=
ble CPUs
> > > > > > being idle. Your case shows that a nonzero budget can stop the =
scan
> > > > > > before reaching an idle big CPU.
> > > > > >
> > > > > > We've discussed a minimum scan budget and accounting for idle C=
PU
> > > > > > availability, though a small minimum alone may not fix your cas=
e.
> > > > >
> > > > > This had problems in the past when Chenyu was iterating on SIS_UT=
IL
> > > > > where the search opportunity at higher utilization is actually ve=
ry
> > > > > low and cutting off search for !idle core was beneficial for SMT
> > > > > systems.
> > > > >
> > > > > Now, for systems without SMT, it has its benefits too but a syste=
m
> > > > > without SMT should be equivalent to a SMT one where test_idle_cor=
e()
> > > > > returns true always if an idle CPU is present.
> > > > >
> > > > > So I'm wondering if {set,test}_idle_cores() can be extended !SMT
> > > > > to act like a gating indicator to say if an idle core exists or
> > > > > not much like how !get_rd_overloaded(this_rq->rd) serves as a
> > > > > gate for newidle balance - it can be flipped to true when a CPU
> > > > > goes idle or if load balancer sees an idle CPU. Thoughts?
> > > >
> > > > I tested idle_cores tracking for !SMT and EAS months ago [1]
> > > > [1] https://lore.kernel.org/all/20251202181242.1536213-6-vincent.gu=
ittot@linaro.org/
> > > >
> > > > >
> > > > > > Given both reports, reverting the commit seems the safest thing=
 to do
> > > > > > for now. That would restore the previous asym search behavior a=
nd we can
> > > > > > revisit a better consistent strategy to cover both sym and asym=
 CPU
> > > > > > selection later.
> > > > > >
> > > > > > Prateek, Vincent, what do you think?
> > > > >
> > > > > IMO it still makes sense for SMT systems since capacity on system=
s
> > > > > with SMT only makes sense if the entire core is idle and then it =
is
> > > > > just a best effort thing right?
> > > > >
> > > > > set_idle_cores(), would flip the flag as soon as an idle core is
> > > > > available and after that SIS_UTIL is bypassed. I don't think the
> > > > > SIS_UTIL cut-off for non-SMT ASYM_CAPACITY systems makes that muc=
h
> > > > > sense given misfit penalty is much higher.
> > > >
> > > > In fact that depends on the number of CPUs in your LLC.
> > > > The current SIS_UTIL is unfair for small system because you skip th=
e
> > > > loop with "low" utilization:
> > > > - with 12 cores per LLC, you skip the loop if the avg utilization p=
er
> > > > cpu is above 839 whereas it also means that you have the compute
> > > > capacity of more than 2 CPUs that is not used and util_est can wors=
e
> > > > the situation
> > > > - but with 64 cores LLC, you still tries 5 CPUs for the same avg
> > > > utilization per CPU
> > > > - and with 12864 cores LLC, it's 10 CPUs
> > > >
> > > >
> > >
> > > As you suggested in [1], maybe we can give a floor value of 3 when ha=
s_idle_core
> > > is true both for SMT and !SMT case(mainly for nr_scan =3D 0 case). Be=
sides, we can
> > > scale up the number of CPUs to be scanned by their llc_weight, to fak=
e
> > > a 32 CPUs LLC for the small LLC system, this should mitigate
> > > the issue of current report and the issue reported at [1].
> >
> > This fixes the regression on my radxa O6 by keeping nr_idle_scan full
> > for llc smaller than 32 CPUs while the avg utilization per CPU is
> > below ~550
> >
>
> Thanks Vincent, James for testing.
> Let me post this as a formal patch with some test data, mainly with
> the AMD server's data, because I only have some Intel servers and one
> AMD server, and this patch might impact AMD more than Intel.
>
> Besides, for Usama's 72-CPU NVIDIA Grace arm64 server, it seems that
> the above patch cannot deal with it, as we only cure the system with
> <=3D 32 CPUs per LLC. Inspired by Andrea, I wonder if we can
> leverage the number of idle CPUs together with SIS_UTIL to decide the
> search depth. In summary, the more idle CPUs there are, the more we
> should try to scan. Given a fixed lower limit 3 or 4 might not fully reco=
ver
> the performance on Grace I'm afraid, because there are up to 72 CPUs in a=
 LLC.

This is worth being tried, in particular for system with high number
of CPUs per LLC


>
> This can be seen as an extension of has_idle_cores to non-SMT systems.
> Unlike has_idle_cores, which makes the wakeup path ignore the SIS_UTIL
> hint entirely, the number of idle CPUs is only used as a floor of the
> scan depth, so the SIS_UTIL hint is still respected in general, which
> is a trade-off to not break other platform/workloads.
>
> I'm also wondering if the system supports the cluster domain, the
> has_idle_cores calculation can be extended to the cluster level, so that
> a fully idle cluster lets the wakeup path ignore the SIS_UTIL hint for be=
tter
> work conservation.
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 1c0e2ac7751d..079d1fc06344 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12874,8 +12874,11 @@ sched_balance_find_dst_group(struct sched_domain=
 *sd, struct task_struct *p, int
>         return idlest;
>  }
>
> +#define SIS_UTIL_IDLE_MIN      2
> +
>  static void update_idle_cpu_scan(struct lb_env *env,
> -                                unsigned long sum_util)
> +                                unsigned long sum_util,
> +                                unsigned int nr_idle)
>  {
>         struct sched_domain_shared *sd_share;
>         struct sched_domain *sd =3D env->sd;
> @@ -12940,6 +12943,10 @@ static void update_idle_cpu_scan(struct lb_env *=
env,
>         y *=3D max(llc_weight, 32);
>         do_div(y, SCHED_CAPACITY_SCALE);
>         y =3D min_t(u64, y, llc_weight);
> +
> +       if (nr_idle > SIS_UTIL_IDLE_MIN)
> +               y =3D max_t(u64, y, nr_idle);
> +
>         if ((int)y !=3D sd_share->nr_idle_scan)
>                 WRITE_ONCE(sd_share->nr_idle_scan, (int)y);
>  }
> @@ -12956,6 +12963,7 @@ static inline void update_sd_lb_stats(struct lb_e=
nv *env, struct sd_lb_stats *sd
>         struct sg_lb_stats *local =3D &sds->local_stat;
>         struct sg_lb_stats tmp_sgs;
>         unsigned long sum_util =3D 0;
> +       unsigned int nr_idle =3D 0;
>         bool sg_overloaded =3D 0, sg_overutilized =3D 0;
>
>         env->dst_core_idle =3D !sched_smt_active() || is_core_idle(env->d=
st_cpu);
> @@ -12988,6 +12996,7 @@ static inline void update_sd_lb_stats(struct lb_e=
nv *env, struct sd_lb_stats *sd
>                 sds->total_capacity +=3D sgs->group_capacity;
>
>                 sum_util +=3D sgs->group_util;
> +               nr_idle +=3D sgs->idle_cpus;
>                 sg =3D sg->next;
>         } while (sg !=3D env->sd->groups);
>
> @@ -13013,7 +13022,7 @@ static inline void update_sd_lb_stats(struct lb_e=
nv *env, struct sd_lb_stats *sd
>                 set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
>         }
>
> -       update_idle_cpu_scan(env, sum_util);
> +       update_idle_cpu_scan(env, sum_util, nr_idle);
>  }
>
>  /**
> --
> 2.25.1
>
