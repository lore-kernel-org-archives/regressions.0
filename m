Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795616880;
	b=emtjk09IhLwUgsgVNHqeZS9OCT1Ha7Wn6OWMxOQlS3CYFy8H28r+HUH9kk+O+sJnfI0Y
	 /kaa2iHh81gdc1W/fuZ1yMtNltyglNQTy2VRqsfe0lELs37sqMMfffHr8otJdesg5EYco
	 VAEPLSBkLQVxKVg+nnMQ3rMAkXhT/MHn4Jwp4WD0BJMJ9g77Ni6znqeWAq3jzG8i4PILE
	 T5Mm6kyaIAGq54dm4ya96AbPfg4m9JPgnJOaIw8o8rrGMru3Wm9jug1qlO2Swj43uiE5x
	 0Jq2dLaOPCyk71HbV5wGfEBStfkAcWj1vEuAr0+rjD5FaUv5fsOh8A+Ikb5blDiGmKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fwFNmmqHFdJGPqkpWLh/ZhIKe/QTslhBxWmeXEZ8bg8=;
	b=S3IrhKNLKcHCk6MGhVxO4S37G1ONQrT3L1LgwtzvRqG/v4mt6pCwFoCWD51LO/M8abRk
	 1RSwOwsLuJzIgGmjqgmVV0PSHPhFecSYwU6Mhfm1ROGs/tAFyIvVKjh52JNo5Tt8puZkF
	 KQ0kzBfncIlrvYOQvhu25wiop05faSrKRvfX/CToM5Ir7zUpgDdsHCs+1Tid8a8H/PnmV
	 pMrGQfVS4/UQk1ZPUwEuwUMAOhqM4b3LhexpA4eoF+KhyMH2jP3BClV/3qTiZ5gpP0WPu
	 ESExBg9JxQIqa/0QS/5HhDnh/vNjpBL2n/ns9Q6rgbS0IV1k7tR6C4l/bCTQGa5kWGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tJCEVYnB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CEF606A323
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 14:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01CEF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tJCEVYnB
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6bab377105dso4357792a12.1
        for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 06:27:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795616878; cv=none;
        d=google.com; s=arc-20260327;
        b=T7UHhnL++Igstw8A+c17PbKhaxWIAZUiQjyEo3kvw6K56Tijj7Imfbg4x/rxRcDNyy
         MVNE+F4XW32VFeIzSSPZ0R5Gv7DmR9aS2na/DhkucxYp3eZ12HqB48MB2EVkqgoIB9xi
         PRAwpM1XcBAv2kLgekntp2N7id5o8+cYvZTMxybZNlfC95RFFtRIk9/x2TVk914DQ+St
         4uwOOx57Is5rhUHC98LEO8YE3Vt5xjoZQ8q1+NuU1zGELvf9oTssFLI+Cr0GZj34RxG5
         6mjmXcqImWzhaoqcIiT3HPB0bmqyDfhKyvnaAxOpWBQCk5U2ume1Lym9mE9tP9JErHDa
         Vlgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fwFNmmqHFdJGPqkpWLh/ZhIKe/QTslhBxWmeXEZ8bg8=;
        fh=4uewpEUl8ZE+w5sxcjDKkYWvk/G81kH1ENGYgCpPR9c=;
        b=E3txqTRNULiFsKFTpKiHDLb586JXh3bqZdS+zEmb2dg7G2QslEsjM0uNYwKvQltV7a
         g2FwNJnUDxDfYUCq/7ccB1BxzioRblH/a+fyPSHi8TneR6yuIGMoWSwGWrS/h1ePce8q
         7eciZrm5wanOrk0F5NCF7Cm2A3/Y2yS6arCgIkA83IeLVA2A8xXyTKNneUqZx41ZoQkB
         adbHBhPAqmazbNgrU5LCrxK0PSRsGNAnIot1UQG45XuOKLcjvy55jmiXQkKFEvwcqT0T
         XL/UTsx+7keQJohOuywBmxwU6rN9lqcya3shKw9QD7zhMPh9jw43hXpPp3WUbOPtzmXQ
         XMrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616878; x=1796221678; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fwFNmmqHFdJGPqkpWLh/ZhIKe/QTslhBxWmeXEZ8bg8=;
        b=tJCEVYnBrhNobg991UM8e5oDFjtByGh3LE2o1D5Rax6sd+3grXEZjXFUMreqMclXXH
         tJbKSylwdxdR0o517kzs9sPIBOl3qUwnPE9VrKXHIUsr5OwNNyx4qdCLukTgU8ZnHh8z
         pNtTmzuYA1dxJ8P/aGaM7CWJWEWeXn5rp2qcgj985JchDgAjqOWcY9X/pSdPqn7QjUcQ
         obXPZWaiD2E2AOGEEpwLl92pAeMrSREjlcRK0kp5jfgAldIljsGZNOPQ4eaz5JV2nEtz
         bO8DTZkOcDNocvKzhI/tkivaqmzPjj3f1uUD3QsWSRWNl8Z9no2wOgrogAuCR5K3WjcJ
         R3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616878; x=1796221678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwFNmmqHFdJGPqkpWLh/ZhIKe/QTslhBxWmeXEZ8bg8=;
        b=ZazLb2PnKuH0Y8xPxzGHwZi4V6H7O3fMKd+r+uvYuI5mcoPIfD0L05HVTLHrwTtxum
         pKmoI3p9+hxlgFC+YNIPgWDDlESQ/40tR9FQaEdIBm28gcZ0BIIjcDzsd6nRo8yJjYAB
         eDjog/S77+DnIvsfD7uG+3r7p/805K0qkKdw6qnaI7TxIcuxKI/FTAMLTFDrP5FnEC98
         PhADn3Rb5oo773mAu/5EAGKZ3/8BFY1Ey509LgWL2eVDCQK/4rW/dVyYEz6OHOaDamOv
         3LUxC31WVx2kINZL0SHqZQ+DA/p3xLs/3R48yvO8CziE7lI1KrvtSv8NA3vAdPFXo8F/
         Knhw==
X-Forwarded-Encrypted: i=1; AL+hErGBZ3yQQlAqVvzWFRqiDTn08cV8S/GZLOfeKsc+Xmtz+3eMFwqfYvoMcKbJVZaHgKUAzldPQVlGTbbYpQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+6Me+Xd4m3Ist6MHvxwU7iA8IZkrEAywEZX05ziup/MjX864wg
	CWbryQb4W2vnmqxNhR1T6J3CK1e/JdCaArgLjqvMc793htkV+XJ6t7HhkRAvHdW84qaB5zcUCpF
	/mCC9Sd2OtMF5z23+BCgXfE52MxFdRd7jIAUuOkddRg==
X-Gm-Gg: AZFdTZdeuvF65ms+K/PPervdQ2njfxPWWUvZaB9A9sdnc611DbN7qsbKpKNzY2NfYuY
	ywaHRABnzIBpLAuPFPbFTup7jmRqkmLYpt+XL0HHc0lFudKAKrBg8r3LOiDooZaK9s9Kqs/1XP+
	Q7QbsFspi4DEjmd/kLMslo5an+fU4U5EHwe4fyFCl2Zg6QoROA1vfK766cberrFdUdxC5ITGfub
	+aMV3N12t1V7HYDTdhJDXbdwfkDMvEWL9kbNNPNPg2jofuoMqJrpEqyXWZPaI4gUWVn9JGSNZZp
	QmbOkl5J3WRR80UrvZ4hoQIHEUZ+HDnkvcGJBGDxsMwnanUJx7eSYPUChpe6uytCneCLvNN6P5X
	tEPxsCE4mu0HlWOosNNFOXbZC6LNM0XJL1HZHb4NPiYSCcR+X67iW7KKAFBuZJVW6gwY=
X-Received: by 2002:aa7:c0c8:0:b0:6b9:278a:99f4 with SMTP id
 4fb4d7f45d1cf-6ba37d5bcd8mr9687220a12.10.1795616878262; Wed, 25 Nov 2026
 06:27:58 -0800 (PST)
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
 <CAKfTPtCudy4NV8sU+JWE=dcJpbKd+LVNZPZztU_0nD1a04Ca9g@mail.gmail.com> <awa3/FFd4hAnvtxK@chenyu-dev>
In-Reply-To: <awa3/FFd4hAnvtxK@chenyu-dev>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 25 Nov 2026 15:27:46 +0100
X-Gm-Features: Aa3M54rachJXiDJ8VfxTvr61OZZ2Zz0KFPkvA1XBk06MhqgBL0PowFoN8vp5YmE
Message-ID: <CAKfTPtCukFOD6nKD6oDYvjEiXXUY5fHui4w6fgnhNw+jpE=0RA@mail.gmail.com>
Subject: Re: [REGRESSION] sched/fair: SIS_UTIL limit in select_idle_capacity()
 leaves busy tasks on little CPUs while big CPUs are idle
To: Chen Yu <yu.c.chen@intel.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Andrea Righi <arighi@nvidia.com>, 
	James Buck <jbuck2005.linux@outlook.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
	Usama Arif <usama.arif@linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Nov 2026 at 11:38, Chen Yu <yu.c.chen@intel.com> wrote:
>
> On Wed, Nov 25, 2026 at 08:51:39AM +0100, Vincent Guittot wrote:
> > On Wed, 25 Nov 2026 at 03:53, K Prateek Nayak <kprateek.nayak@amd.com> =
wrote:
> > >
> > > Hello Andrea,
> > >
> > > On 11/24/2026 6:45 PM, Andrea Righi wrote:
> > > > Hi James,
> > > >
> > > > On Tue, Nov 24, 2026 at 11:56:52AM +0000, James Buck wrote:
> > > >> Hi,
> > > >>
> > > >> Since commit 61ea17a63719 ("sched/fair: Add SIS_UTIL support to se=
lect_idle_capacity()"), first in v7.2, CPU-bound multi-threaded work on my =
big.LITTLE arm64 board runs 12-19% slower than on v7.1 and earlier, because=
 waking threads are placed on idle little CPUs while idle big CPUs are neve=
r looked at.
> > > >>
> > > >> Turning SIS_UTIL off at runtime restores the old speed. select_idl=
e_capacity() and update_idle_cpu_scan() are unchanged in v7.4-rc4, so I exp=
ect mainline to behave the same.
> > > >
> > > > A related regression from the same commit was reported by Usama her=
e:
> > > > https://lore.kernel.org/r/20261113153157.2495664-1-usama.arif@linux=
.dev/
> > > >
> > > > On Grace, a zero SIS_UTIL budget skips the search despite suitable =
CPUs
> > > > being idle. Your case shows that a nonzero budget can stop the scan
> > > > before reaching an idle big CPU.
> > > >
> > > > We've discussed a minimum scan budget and accounting for idle CPU
> > > > availability, though a small minimum alone may not fix your case.
> > >
> > > This had problems in the past when Chenyu was iterating on SIS_UTIL
> > > where the search opportunity at higher utilization is actually very
> > > low and cutting off search for !idle core was beneficial for SMT
> > > systems.
> > >
> > > Now, for systems without SMT, it has its benefits too but a system
> > > without SMT should be equivalent to a SMT one where test_idle_core()
> > > returns true always if an idle CPU is present.
> > >
> > > So I'm wondering if {set,test}_idle_cores() can be extended !SMT
> > > to act like a gating indicator to say if an idle core exists or
> > > not much like how !get_rd_overloaded(this_rq->rd) serves as a
> > > gate for newidle balance - it can be flipped to true when a CPU
> > > goes idle or if load balancer sees an idle CPU. Thoughts?
> >
> > I tested idle_cores tracking for !SMT and EAS months ago [1]
> > [1] https://lore.kernel.org/all/20251202181242.1536213-6-vincent.guitto=
t@linaro.org/
> >
> > >
> > > > Given both reports, reverting the commit seems the safest thing to =
do
> > > > for now. That would restore the previous asym search behavior and w=
e can
> > > > revisit a better consistent strategy to cover both sym and asym CPU
> > > > selection later.
> > > >
> > > > Prateek, Vincent, what do you think?
> > >
> > > IMO it still makes sense for SMT systems since capacity on systems
> > > with SMT only makes sense if the entire core is idle and then it is
> > > just a best effort thing right?
> > >
> > > set_idle_cores(), would flip the flag as soon as an idle core is
> > > available and after that SIS_UTIL is bypassed. I don't think the
> > > SIS_UTIL cut-off for non-SMT ASYM_CAPACITY systems makes that much
> > > sense given misfit penalty is much higher.
> >
> > In fact that depends on the number of CPUs in your LLC.
> > The current SIS_UTIL is unfair for small system because you skip the
> > loop with "low" utilization:
> > - with 12 cores per LLC, you skip the loop if the avg utilization per
> > cpu is above 839 whereas it also means that you have the compute
> > capacity of more than 2 CPUs that is not used and util_est can worse
> > the situation
> > - but with 64 cores LLC, you still tries 5 CPUs for the same avg
> > utilization per CPU
> > - and with 12864 cores LLC, it's 10 CPUs
> >
> >
>
> As you suggested in [1], maybe we can give a floor value of 3 when has_id=
le_core
> is true both for SMT and !SMT case(mainly for nr_scan =3D 0 case). Beside=
s, we can
> scale up the number of CPUs to be scanned by their llc_weight, to fake
> a 32 CPUs LLC for the small LLC system, this should mitigate
> the issue of current report and the issue reported at [1].

This fixes the regression on my radxa O6 by keeping nr_idle_scan full
for llc smaller than 32 CPUs while the avg utilization per CPU is
below ~550

>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index da0d9e19c457..1c0e2ac7751d 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12937,8 +12937,9 @@ static void update_idle_cpu_scan(struct lb_env *e=
nv,
>         y =3D SCHED_CAPACITY_SCALE - tmp;
>
>         /* equation [2] */
> -       y *=3D llc_weight;
> +       y *=3D max(llc_weight, 32);
>         do_div(y, SCHED_CAPACITY_SCALE);
> +       y =3D min_t(u64, y, llc_weight);
>         if ((int)y !=3D sd_share->nr_idle_scan)
>                 WRITE_ONCE(sd_share->nr_idle_scan, (int)y);
>  }
> --
> 2.25.1
>
> [1] https://lore.kernel.org/all/CAKfTPtDVqKyQ491MdUr2RbGmJ9ivofiiX7D7Xd-S=
h2F0NLFmRw@mail.gmail.com/
> > >
> > > --
> > > Thanks and Regards,
> > > Prateek
> > >
