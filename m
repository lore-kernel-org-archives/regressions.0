Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC921DC481
	for <regressions@lists.linux.dev>; Mon, 19 Aug 2024 19:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724097480; cv=none; b=Lwy+UYT2Zzzo9dywIdCsOPYzAyuQUcsK1ABF3VH+4n+KMxjmwIVlgqMYr8TV1iaM0RaJqn0/ezT/XJyhnqsJQPVMUt87XPbWVsM0A8c4M9c2BPRnQgRo6rjihLFzM/sG8wCVcGAjydevCQ/PrHrmoTEWZl1Eg7AJ7yJkduF6idQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724097480; c=relaxed/simple;
	bh=KeLyc45Fa3bvQdr6Qz/zOaHsEIUZHjNw5l90KB0Fe2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gk+8DzNp/IVcUt45lQAhvBIt0ktGAo70chDnzMrjxA1kdHUusb9NY1ryctEcosfOZzNBlcDCqJJ7rI5z8A5Smiw6ZrQFfx3DkO4Dr6Mn7pEe+pu6nOHpZp2MzteKBNRhuS9Xw2QVDsQZgUHoE09UCUIoHAE2loneO7GhTRtDYLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zKi3cUPs; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zKi3cUPs"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4989b18ee2aso1242950137.0
        for <regressions@lists.linux.dev>; Mon, 19 Aug 2024 12:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724097476; x=1724702276; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnpJD7zOEcGCzuRggKrq3czVGY129TNUmE3//qsWRmo=;
        b=zKi3cUPs47iHumb/Jalhtu1qdlDFy8q9tRwly/6M8dRP6pFQpwcjebpV5u21h/HzEf
         suK9VoB8YUdgDcCbDL3lSbSo6i6o3Rg8yKON9ps5oCt5eX03VMk606GU4agfqBqoqdWG
         iqVOlQXVdU7xeVe2/TGPv2Ku1PqrqE2gtP6kqAgXD/Zcpo8cA6vLuxPHC0XnPNgP0oLQ
         Ksd9lSJMPNmiUL1HOWuccVGE1HThMThkbgcG/9AZ30NVCyyHE9/T9i/P9Ug/qQeIey1s
         +21TX+o4TWt4poFdtj/q7md858KeCizPbOFljXRfLwFApmwG1yty4QeyEYKtHZewdsdn
         NBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724097476; x=1724702276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnpJD7zOEcGCzuRggKrq3czVGY129TNUmE3//qsWRmo=;
        b=ESCoUEluRfqvMAyJfQT/LWZTLMjVRYKm8iMRFWIYxgVmPtroCsAFCr2BKpNZn5TFTY
         j+2dxZZ11uL2avFafD8AhaLVw3L2CetB+8wgIHhT+RR6bxh01wAoMq5sWaMeF5grfkmM
         nWRLP2UdBn5C0jtaKs1zxWtokNsDe5PNZ7jU9+4SlOuPt4LqC1lJBtBbc8EDGJcB9ypB
         2iRKje1csgIskL2itayC8sUzP10VzzuSs99X7zatqUUodZkjotJWx9ujNgy8Hnowvk88
         wGVP6K1IpeA9SYUd/76AaY0XC/vYGWlWCBJjtQcIuBs4G5ql6y6MKBgRAJ1RKT+cLC1r
         H2Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUIroSGC9mT2npw/0vtH6pYFFWhpCsCNgvnQfERF708m2pkzoWjelVFssVHyRW/kf8Oz+7XKS7wxM8Pgg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywjxy8pERNBQw/TRWvbB2ddKt1U9jl5fPkyIam7zbrktktq+o2M
	25cecByOlG+Lm410g5gU6f16eLPbCJ0CQn9HlO3nLQhqH0v0caOfaOXk1ni83pQG+JYcG/jGTLj
	sDPz846UPyjcgdL0vCji7xTlS6smvTIBp7mkbLQ==
X-Google-Smtp-Source: AGHT+IGK0LY3tdtqWeFRG+uZZtVR/W7GoroGGMy79582gduYyn5m8Nqwz9BjE5mfCd13Nrjeql+K94+u37gPhcxzdQU=
X-Received: by 2002:a05:6102:3912:b0:48f:361:9fe9 with SMTP id
 ada2fe7eead31-498be9fdbc6mr800429137.3.1724097476320; Mon, 19 Aug 2024
 12:57:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuFDon59=Nw6WCdgp0FanZ1oE3dCkoq71EK0Bxe6Jhe_g@mail.gmail.com>
 <CA+G9fYtd1Hw9YLpceUAwwC+UytVQVXOET4gmGT9jiCgHa+WexQ@mail.gmail.com> <CAMgjq7Bz0DY+rY0XgCoH7-Q=uHLdo3omi8kUr4ePDweNyofsbQ@mail.gmail.com>
In-Reply-To: <CAMgjq7Bz0DY+rY0XgCoH7-Q=uHLdo3omi8kUr4ePDweNyofsbQ@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 20 Aug 2024 01:27:44 +0530
Message-ID: <CA+G9fYv42RAzYp6i-hUNz2dDn0i=_qoQXtjgc6h4z+wY9-GREA@mail.gmail.com>
Subject: Re: gcc-8: mm/swapfile.c:863:40: error: array subscript 1 is above
 array bounds of 'struct list_head[1]' [-Werror=array-bounds]
To: Kairui Song <ryncsn@gmail.com>
Cc: Chris Li <chrisl@kernel.org>, linux-mm <linux-mm@kvack.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Barry Song <21cnbao@gmail.com>, 
	"Huang, Ying" <ying.huang@intel.com>, Hugh Dickins <hughd@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Aug 2024 at 17:14, Kairui Song <ryncsn@gmail.com> wrote:
>
> On Mon, Aug 19, 2024 at 6:16=E2=80=AFPM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > On Mon, 19 Aug 2024 at 13:58, Naresh Kamboju <naresh.kamboju@linaro.org=
> wrote:
> > >
> > > The x86 builds failed with gcc-8 due to following build warnings / er=
rors on
> > > Linux next-20240802 to next-20240819.
> > >
> > > x86_64 defconfig gcc-8 build failed
> > > x86_64 defconfig gcc-13 build pass
> > >
> > > First seen on the next-20240802 tag.
> > >
> > >   GOOD: next-20240730
> > >   BAD:  next-20240802
> >
> > Anders bisected this and found the first bad commit id as,
> > aded4352f648 ("mm: swap: separate SSD allocation from
> > scan_swap_map_slots()") first faulty one
> >
> > - Naresh
> >
>
> Hi Naresh,
>
> Thanks for the report, the problem will occur when CONFIG_THP_SWAP is
> disabled. Can you try the following patch? I can confirm it's fixed
> with my test.

Thanks for the patch.
I have tested your patch and it fixes the reported problem.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

- Naresh
