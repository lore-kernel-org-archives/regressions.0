Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED56937CD4F
	for <regressions@lists.linux.dev>; Mon, 18 May 2026 18:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779128121; cv=pass; b=Z2KBU5g0N3VhgvzJGduEnDziSJp0l4lSl0HoQ90yLg49Q8Eng1gofWavA2TmJ1DrWdx390wOR85bUtilTB6dbspS3LfxDAiMXM5Qjp+10HafRxCZJ+w4qXbw8iHWqZRRsimUmTNpHTAHngMCZdnHqjwn1YO+b4V7WhIPai2Q5LM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779128121; c=relaxed/simple;
	bh=OMiWVpsTBGBFFZMjNgD23EoiPax6keHbI1aHA+i2npo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bzLD7QBHe6ltHwHbttCvdacP2BYVtXVgDs3N6WPTodoo7WxO4T+WGY9L7PQFQ0uWftO0c/0SWb6wgCaKanSvQ9/EVbujebBEn88+PKfmctleIL/MCWGTHd+VD5jl6Ke8tps7F7f5vi6TmlFoGrueX1TfOps5mx7VPXIVaO8l5BI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0QhsaPG; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0QhsaPG"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67cac5ece75so5413050a12.2
        for <regressions@lists.linux.dev>; Mon, 18 May 2026 11:15:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779128118; cv=none;
        d=google.com; s=arc-20240605;
        b=CUMTbpHrjOJRZsXK9gn/HUkrs4P1L1Ch5qaZfwVPf5Sc4Ehmlxfp2e6QUF0xrjnxcE
         +WwMdcocRyVf1EpDLC40mj41/5Z/zu8E7L3Wb4SQQ5zmmmurqfU4lJ9eqbYx6nclXCC9
         H6kpPH3ueVrcaZh+xf1E8fpuv+6kbYpqv8SIO1NPlgAxs2p6Bm0fqJt7ae4P8hchyRYi
         KkILSSRn1MHKOIJ7usP8T907TkuyBOueMZonK2eCUJQBNJQzWgNBgoPByuq8DgCUb97K
         FHmIbeJhX0dIgEiOWa4CDes3VyXQ8ZAkU6cRYb/nuuvMvvvALYGrG62yvptLDXYfxlhr
         OUVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M1wmMbcFrpofA4vgLByx647zKSABWtCNtkMoNw+NiJ8=;
        fh=Xe7NJ1qieCCV5L8dnTwKfY1IEDCAdDWRfSza4K76ybA=;
        b=FfQYpxGhp8hwHY8vuSb94fJJJdrvTV4Kya1WcAI1bMHrks6E/cMR17lv8O+RmXtdvQ
         yVSIjsUoxwmKaFxIgeGPv6j5TEpMjTmlVypNyHXXauD97UUGggBpquKTWc7PZ7BOGQCr
         2Itxt9weGYIodEO5/L1to7K5O/qFhCfJH3y6JsXhU01NdwLQENEd7usDD77IBZwgbFkK
         wDofyYgV2d/zE6RMlse5YetJRxIC7Fy1j5h502IhYBCrKqhRd3yKgt85RDNWlxLpgbNz
         cUV83c3IajZIBKSI4N7iwFMWpvf8ujuXMnYIcEwg+tVcRn+JsfP3QUysZRZv1r9zO1Yz
         mzTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779128118; x=1779732918; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1wmMbcFrpofA4vgLByx647zKSABWtCNtkMoNw+NiJ8=;
        b=i0QhsaPGcnKu+aOgsnscgy5Oc3L6zJGyqCUeJxXMvtKA/Nqyo/LJsJbnsk9h0U6E8q
         NJP+zwTRu/BlXOIHVlIWJChXC4NS2kS0zPIJwEsIuJRhcqaKFgyljD54TON+rj3GvZhB
         GOstEqK6oZm4S6kjxNEJ2xxzaKqdheAe7p89gF8HpBXfAGgRfwBmAE0cK79N4RVc9eEH
         4EkUcVyNa0H6UNcq/7Hrap0uwAmLFzlttzSTmOY/XLwz+iF74/jDJ9V+fIilgY8fhmMM
         ecLNLUkwGbDv0YvbRcB1FW4qNBsFbMyG1SRdhl5Yl41pbDJOS1OIBjTeo0zd0LqW41u9
         dB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779128118; x=1779732918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M1wmMbcFrpofA4vgLByx647zKSABWtCNtkMoNw+NiJ8=;
        b=aZiY6Kmz39NdjeTOsZA7/tr2racbCnhnoRJPnjweOx5CXsyJzOBPfySMGCUzTR2psb
         x6w6e2/1kiTES1cNFFVBe26zBSFcozrkF1b1vuWT+DXn+CH+bGoCXJCcXWYRNGEToYTO
         V2D5FDMF1EWKs8q5Iu/U/gDpneyJqj6ZwyT7CjQMql33dlraIXjnJSVLymbpAE3mvDUN
         7FsLW5HJYDYsZd3GrgWjKSpCTaJ18CfHyxwT4LGUOSoEkMaX4as4ypXYto4W4ZOpukrc
         LNjAxTTXtiWp2By6uLQ2K/vnxAUuToySUlo7mloYYj2KdDAe4LLzQp4Y6J5vwK3d1Suh
         0I+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+l+5XffYcGzGHGOojpWLoXvCQKApf77oLVn1n0S0LflzUYRBrlIJB3D7x77JXXs6hdokJQGUMtMLn6ow==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJFutPdLde8coyu32P23Vgwnqny7iuJkFq/t8j4EAR9ZtmNR82
	WSo0CKF/SMAtS3o2bO1sKrnUML1PsATxk62Ttdo77YAZd+VrXlDG/vKNkxVlV5ll6ONVJks2NjY
	E0xI05XTUPeujajN/qpd847b+Fw4biI4=
X-Gm-Gg: Acq92OF2CesJOn4qXJ69V+/JcPUYa+77Qq56KeijqMTQQiXraYL4Shei5SPg7YQhOxg
	mBSBVmIiHhuROb+oaDnmpZ1D3NeDfJY4XDfwckdJjdDdSe8D7GRLc55XnmPxAWdiRNqGgzeL5Sc
	wvBtyN5+7jVidw7MsJFQHy66hcYmtwYajjXx4ENsBp+AdiziYqKY3wJc0OrRNgV667gNadkvxNB
	V/DiwOE+HQ+nz0yxXxHJpigicMw66VeWZMCm6kzzoCJiNHEwBRvLgY9AOBm++svC0ZnrCA6sH/y
	MYz7YxK1WdrhmKRQwY+xPHywkWKE6whGs6k2tEW3tf2OKwHVkr0=
X-Received: by 2002:a05:6402:4589:b0:66f:8fbc:c73e with SMTP id
 4fb4d7f45d1cf-683bc5b8f3emr7684286a12.9.1779128118128; Mon, 18 May 2026
 11:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3f4567fc.f496.19e3b2b297b.Coremail.23020251154299@stu.xmu.edu.cn>
In-Reply-To: <3f4567fc.f496.19e3b2b297b.Coremail.23020251154299@stu.xmu.edu.cn>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 19 May 2026 02:14:41 +0800
X-Gm-Features: AVHnY4JHoWxK6v16uLtT_OkK8acXtftWVLpBAXhOTjv3-TsHAelpZGafBq-MPZI
Message-ID: <CAMgjq7AD2ivdgD_kRx+0+w0M=Fvz5dXepw84_Ui_q7=97B4Ofw@mail.gmail.com>
Subject: Re: [REGRESSION] mm: MADV_PAGEOUT THP/no-swap refault takes ~1.7x
 longer on v6.19 than v6.12
To: Chengfeng Lin <23020251154299@stu.xmu.edu.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Chris Li <chrisl@kernel.org>, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 9:09=E2=80=AFPM Chengfeng Lin
<23020251154299@stu.xmu.edu.cn> wrote:
>
> Hi,
>
> I would like to report a userspace-visible performance regression in a
> MADV_PAGEOUT workload.

Hi Chengfeng,

Thanks for the report. Very interesting, but it looks a bit confusing.
You are doing PAGEOUT of anon pages without swap setup, so nothing is
actually being pageouted?

> The workload is intentionally narrow:
>
>   - map 16 MiB anonymous memory
>   - use the default THP policy
>   - run in a guest with no configured swap
>   - call madvise(MADV_PAGEOUT)
>   - refault/write-touch the mapping
>
> This is not meant as a generic madvise() or generic MADV_PAGEOUT
> regression report. The signal is currently scoped to the THP + no-swap +
> refault/write-touch workflow above.
>
> The current public evidence bundle is here:
>
>   https://github.com/lcf0399/linux-mm-regression-evidence-2026-05/tree/e1=
3469b/madvise-pageout-thp-noswap-refault
>
> The standalone workload source is here:
>
>   https://github.com/lcf0399/linux-mm-regression-evidence-2026-05/tree/e1=
3469b/madvise-pageout-thp-noswap-refault/workload
>
> The formal experiment profile is here:
>
>   https://github.com/lcf0399/linux-mm-regression-evidence-2026-05/tree/e1=
3469b/madvise-pageout-thp-noswap-refault/experiments
>
> The formal timing runs compare v6.12.77 and v6.19.9 with similar kernel
> configuration, using QEMU direct boot. The formal performance runs were
> clean timing runs with coverage disabled. Coverage was collected
> separately and is not used for the timing numbers below.
>
> Lab environment:
>
>   host label: lcf
>   host kernel: Linux 6.14.0-37-generic x86_64
>   QEMU: qemu-system-x86_64 8.2.2
>   container/cgroup CPU set: 0,2,4,6,8,10,12,14
>   container/cgroup memory limit: 16106127360 bytes
>   guest memory: QEMU_MEM_MB=3D14336
>   guest CPUs: QEMU_SMP=3D1/2/4
>   repetitions: 9
>   version order: interleaved
>   performance coverage_enabled: false
>
> Primary result, cycle_ns_per_page, lower is better:

What is cycle_ns_per_page? The name is ambiguous. "cycle" reads like
CPU cycles but the value doesn't match. Or you mean iteration? Can you
make this cleaner?

>   CPU   v6.12.77   v6.19.9   old-lower-vs-new   v6.19/v6.12
>     1     1900.3    3304.7        42.5%             1.74x
>     2     2107.7    3583.2        41.2%             1.70x
>     4     2154.2    3690.9        41.6%             1.71x
>
> MADV_PAGEOUT syscall/reclaim-side segment, advise_ns_per_page, lower is
> better:
>
>   CPU   v6.12.77   v6.19.9   old-lower-vs-new   v6.19/v6.12
>     1     1713.2    2922.7        41.4%             1.71x
>     2     1924.7    3162.9        39.1%             1.64x
>     4     1953.1    3284.2        40.5%             1.68x
>
> The current mechanism interpretation is that the timing difference is in
> the MADV_PAGEOUT/reclaim part, not primarily in the later refault touch.

Right, with no swap configured, the post-advise should not be faulting
at all I think? It will just split the pages IIUC, however, that might
cause more TLB pressure. But this split-on-alloc-failure path itself
wasn't changed from 6.12 to 6.18. If there is no swap, we can skip the
split though, and maybe make folio_alloc_swap fail a bit faster.
Skipping the split seems more meaningful and could significantly speed
up this specific test, if this is necessary.

> The path evidence points at the no-swap reclaim/swap-allocation-failure
> chain:
>
>   madvise(MADV_PAGEOUT)
>     -> reclaim_pages()
>     -> shrink_folio_list()
>     -> folio_alloc_swap()
>     -> swap allocation failure path

What you posted, include that repo, seems only has end to end timing.
It would be much more
useful if you collect a perf or ftrace breakdown something like:
https://lore.kernel.org/all/CAMgjq7BfO=3DdNYep4z1aS7nUAJU3bktR17gYAufx=3Dkk=
Ludq4dAQ@mail.gmail.com/

Or like this:
https://lore.kernel.org/all/20260422003412.11678-1-xueyuan.chen21@gmail.com=
/
