Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8A43AF642
	for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 08:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777450971; cv=pass; b=WrWd06nifL4l/bVoJSigMUum0EMIQGRUOE0wZM3FAPWuxrpx4z6FpmPKVOS6ptge1y2tCkqThlSmlK5VwStL6FzWY/5/bVD8MXjlvuomHhGKbge5nvxJkz4f8HUcI0AiPGZYTF8P3QUlxiY6gBLQ7POCI6xc8Z2d+dEYGcRoZZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777450971; c=relaxed/simple;
	bh=QMIexiS3w30F+i/rgGUir2GUYE7nYg8msUQh5MMI2IQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOGWObkTzjk8n0Ipwqb5z7ZUn7qFGTEZlUyo1tDDFbaiUrXcwA/eUhMeR0v0L542oTihSnFaxVxJyJINnwLbs+/+buJxhryDi92cdS6gtczpJbG6dO4gbybnlzVdtAIy4B4Mq2ofmfgPO29t4B1/9WUpK/m+O4uFh9R6irLmf9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O7u3A33z; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O7u3A33z"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3878de20527so95268641fa.3
        for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 01:22:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777450969; cv=none;
        d=google.com; s=arc-20240605;
        b=Rm9BhqIvsEIFKYjfhOIdABtSvkyS0wfcyA3YRifv28+ql/DB7qzI/BKIXhd+b2P+kW
         CCK1Wm3i5u0VR6eSqlONSmvTfAtcVRtFh47gZd0Dzqa5KU+e/AoRMOuKChrNwUm0kL+Y
         OxGMZc9Bttf0B05gqh0Hw/zE/s32zvGu/jlCMRIBqJnwF3u4PhYHIXBQoJAZYdq48ui/
         Yt6979jKXpDXWN8tdyZzB0l9SR95lc3PjYkfxHOhxPB5QJl7/euzkE+Vu4B1h+ZGl4c5
         /POTZEdGCPhokgroxzsZbDGaGD9m3sQ9ffttefDYiMK4uMeCCgqOGgVwOpH8J6M+LqeO
         +6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cR+LIUqKtMciQbVPi5gi+r/yye6H6/khj2zavabOARg=;
        fh=qHwSOvdGu9dAAXfYQYq1Sw+1P4aMr0zO7SWX8Il8+pg=;
        b=F7NNlYity6VtT9fbr2ybkssgLD6zJrUVQ87XeiFH6csqt1hNfo0cyfe39k6WTi4Dqj
         SOUAsxQqsQeN4P0JxIVfOa2ynSCl9swWgxC/CTgBcb6cm8LJ8g79Di++AqYT2YeEzUhs
         OoK2PxfxdxZbkqoZSgGyswphrmNcEVDgxMuO7AUVs8tI4Hcc0GDlJAk5G67cTphaD1Tm
         tLYCD8ZWzNFPfCWFflEJK48BG6SWugnsCKE86kHSoj+V5oCzsAWJOFm00Wp6qejlK+5Z
         j7uWlID2QrEW3pSQUfpfpeIMrJwgp/g35XhFA34UebMYjDCspZV9HNNHl1/5DJCmB25v
         CRPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777450969; x=1778055769; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cR+LIUqKtMciQbVPi5gi+r/yye6H6/khj2zavabOARg=;
        b=O7u3A33zSp7gRIEj5ciCJFXo4msLgttFRPlYuAzNlr/DM/Ezn8FalZhwfPNL3etrkU
         0L8P6DlcDRSnawOJcjet95gStivNqyZNHlIfPZ3jaNVSZCKEM3ZGwvQuCoPjBjFSwF8W
         VTyBo622bPo0FLoBNfv+KSgFZ8qHa5H+b5bN+9Kc7ywSdupXaWJ79ryt/1RqyKIMM9OE
         i7yoW+RND7egWbY0+UsT5zEw69ccpuplXf/oUZhhUABXHyCpWhGE+00uLahDkcZgRS0H
         tNFICqSc800gSsCR0MzAQHGPVVUxXTbsZg3edZEkC5C6n54tBD8fWh90sLkXd7b8S0cn
         BVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777450969; x=1778055769;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cR+LIUqKtMciQbVPi5gi+r/yye6H6/khj2zavabOARg=;
        b=UTEZvWquBEG4+FY77rNxllQRrlHzp4DRMKNKIPYxkOMdD9aGYCBHP2RRuL+0Q8SpMT
         QmN+2RrjqeV/D5XIu5ry9SD/onb97E4xY8ZnVQ6PYgqz+vnHeFi3m07ySNxkrPOaMcxv
         mJwYPDp79aae3t6ZXVJ11FDjAjaVq1OkQpZYQMIKom3g0+ejR8iifm7sddBY/dCoYABg
         pbN3AwajMZQuoIW9nzxRQx3n8C9RkGK6kdTMqbPW+Jw5/Ze4LTxBFYg9mQFxL4bf736D
         Kky+AyaKbgD6Z5SGaI/oErGb3smlDZjDQKjwYzs6EIIZo/qFu60LXOyMC5Fbr21wAtTR
         nqQg==
X-Forwarded-Encrypted: i=1; AFNElJ+96SDh9F0H9fIqyy4zHeSRWebcorb/h7VTF+dmAVUqnpFyhJkj5qU28ossm1rI1lwp6eaL61fol5XRgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzcgju+OLNlEuKVnqgg1/2rZXpQQCenfw9h7uWnUMqAKnjhyHhL
	AHlELkpI2TjA78eZGU7WDxRemgNiETFGVZkZnorTtYba4vmdUQ2tMhiD//z6+8YZSJrHe/xSYBP
	zgL7vau9u+aZGFyHGBqq06vcBSkIEjvgtRKe+F75m
X-Gm-Gg: AeBDieuu609Pxmele0BNUU4jha3iIpWYn3lSaYaGl0wiPY7GfDxDLc+GA5I1VMnxXS0
	g3XocJ0SNe5BflE4aS2aNnwPbb5ICKfBiokB3JJMcfBxIzSarD/iS/8z9iTefWPDuD6Xa3TEN9S
	9yCYutd34Yazgx98d0/ktwJITMYit17KjaD0Ypp6rs13lTaDOoNsTVczxqql5SlQp25ulOac4Kt
	fkxObykYyWOjxG479czQzYBHG2Udg7745YFBnX8WuE6pEGjlhdMh7nPVjQn9JPKesyolOxhtOMH
	kd+cV54M9FJKbyAa+qgyw9JDmIA5MD6+fsLQRGorp6fstNK1HEkU2ozQSdfrI233Tw+HwPYB8rm
	o2ZKWnNH9ZS91FvWKoA==
X-Received: by 2002:a2e:9fc8:0:b0:38e:bf20:2758 with SMTP id
 38308e7fff4ca-39240ccfc4bmr23514281fa.9.1777450968292; Wed, 29 Apr 2026
 01:22:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428221058.149538293@kernel.org> <20260428224427.353887714@kernel.org>
In-Reply-To: <20260428224427.353887714@kernel.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 29 Apr 2026 10:22:36 +0200
X-Gm-Features: AVHnY4IX_PemTXtwPIZdYMebOlq58du3lkZPLQ-D2jLt8xvBVvze9Js-VpSakHE
Message-ID: <CACT4Y+aSmUJOwdKdiNP4mKhGwjSOvS42ueByLdCj_P_aEZvu8g@mail.gmail.com>
Subject: Re: [patch 02/10] rseq: Protect rseq_reset() against interrupts
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Mathias Stearn <mathias@mongodb.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-man@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev, 
	Ingo Molnar <mingo@kernel.org>, Blake Oler <blake.oler@mongodb.com>, 
	Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>, 
	Matthew Wilcox <willy@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Apr 2026 at 01:33, Thomas Gleixner <tglx@kernel.org> wrote:
>
> rseq_reset() uses memset() to clear the tasks rseq data. That's racy
> against membarrier() and preemption.
>
> Guard it with irqsave to cure this.
>
> Fixes: faba9d250eae ("rseq: Introduce struct rseq_data")
> Reported-by: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>  include/linux/rseq.h |    1 +
>  1 file changed, 1 insertion(+)
>
> --- a/include/linux/rseq.h
> +++ b/include/linux/rseq.h
> @@ -119,6 +119,7 @@ static inline void rseq_virt_userspace_e
>
>  static inline void rseq_reset(struct task_struct *t)
>  {
> +       guard(irqsave)();

This may deserve a comment for future readers, but otherwise:

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

>         memset(&t->rseq, 0, sizeof(t->rseq));
>         t->rseq.ids.cpu_id = RSEQ_CPU_ID_UNINITIALIZED;
>  }
>
