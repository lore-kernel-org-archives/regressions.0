Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD7444E66C
	for <regressions@lists.linux.dev>; Tue,  4 Aug 2026 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785840389; cv=pass; b=bThCUXNHxnweiFvek896fxoarfYchQuoqhLwRM8yKA6xG+oplbe5seZR/HiZYI6L84oG1q8EUc+WivA87iPVJsJY7r8AmcRz3s+vYbjf4PPtOj720Uk7hM8I6E0XNt23fa8ZXkQf7CPPYsq4RlyBnTjabhBlrdYlpHO6OFBPuS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785840389; c=relaxed/simple;
	bh=L4pVXJjEpzP7a6JTASFd5jgksujhFZUMubTVjmSZMj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K0Adt3sRyGcuV/oeq26V2FDxWJaARITNu2hJSQaYYHauO/eWVbWTIujlqndpNAYaCklMn3MblQmW3tv/zcIhxSstQZsPRFn8Efp10X8km0+i69h7T+uF+j7RxSyJFASq+VsEbziQos9X7B6f9rdafZCvqiRts8iaeZv8FKSiN/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvh2jdR6; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvh2jdR6"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso4937770a34.3
        for <regressions@lists.linux.dev>; Tue, 04 Aug 2026 03:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785840384; cv=none;
        d=google.com; s=arc-20260327;
        b=AKIgBvjTU8fjqFBvgHfYni01KKufMsKauXjlACmdfI3rakH18YZrpHvQiXNnAciBcb
         PWTM1unX5qvq4GRAc/rzbH0zQZEmxm1tL9PRkWf5JCNwVGAPNV/sNgdGN86M3DAou5bF
         21uFu7XQj9eevlY9/WgPsUv3b0O/TdQHd2uUBBdNo1fY8Lv0efE19LQCnF245PMgBfmE
         sXQgwdGO19hch8QAv6zotUg1asydmW5MvikYfB7Q0L7v6NgJYhkBloL9I4dIxlxDpuBq
         N02GfcVTNWFcdqWbvn2RoXcF9jERLQ2IEPsze8B5g4cytvxdZt5bLgIkndfyJRuzBTSL
         s0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J6gF+Q6fG/qRNe9EMJ3JBoepBuQH8FTOnfFZfpMVvKI=;
        fh=LrC1Lqx6Qt2S0vKakR3u+QFympZkzIGbNyc318lMiDc=;
        b=MjDrf6sdcrBLnlLjttKOLjCQUx9dltEbglOth8BMg9ndZ6w3bFd30ZJX66HTQ+qyko
         Uxhq0ETWd6L/4Pfa04ru1yI2NfkrjzW3wvUR/tPe9WoY2XJJ9awvq5oUfZk9sNHQwGK5
         6XJqnmCLocbjiFqxGm1iU6n43nEWTKfW5jMfDTcdh59FWSl9QXRPH2Go7QvM012BamEg
         mFQhvOSx7Ia6NiH9/bRsLa0VuLip5ad+3pFoM6TOdV58YsKIZAc26cKaNGr7i5nQhsho
         5No5crjukPl5jAoq6UcdJRzqFPRVkyPIs/wXDV9bnjrpDNed3oiyxEsX3RF2yv63TdMY
         7iPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785840384; x=1786445184; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J6gF+Q6fG/qRNe9EMJ3JBoepBuQH8FTOnfFZfpMVvKI=;
        b=fvh2jdR64+8itS9NEUJxER9+llIv0Qtxx5Pw53bmvo7YIkjRF6oWY9QD8xWDgFSCO+
         pVz95xuj+1fwifT7CwLFCKrp6mww+c4jtYWPFNDNwIbZX9KIeLiAev+4MIo23Q8K+jhP
         hjZExdL1M4gu/7OBDlk7L1nVIUzhlSUmfiLEX64cq1T0NSdrBj6+y2/axfgIyRUWE9pO
         yKfhNZsnXWE3jG4CcCc6uVjapx0FhuJspoFqRAt8KJrMVa47s2SQVjMoXiURhg6+SuI2
         ECwhLqROV0Shb594VRdcClnJTv5yJ5UXHGDZjnsOL8jGE8zMMhJ46+Zi7Hk1V4Bb0Vwl
         qpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785840384; x=1786445184;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6gF+Q6fG/qRNe9EMJ3JBoepBuQH8FTOnfFZfpMVvKI=;
        b=LcBKkk/4bXTZ1owEn8tLL1OJzaf+oyLuhau2GPb1dtN3J63P1VyNdnwCgzvGuA0Vgt
         HBNhJeDxi1V14/RsmD7he+JnNpj9nodMvikWTEvLi43vXsdcLEVQEjBYYwO6RRMI3btL
         V5Zu4sih1WHe3xW1yikLJp3Gbwa345udPsMjeVHKpQtRTJm/IvUW7NhPbgucNNtWugHT
         wp8T64a/kiEvgpDyrI/eUNDKjYxuQLdcRkec31hiebAbEgaRezlpQxgQfPEkhQn9bvIy
         a7+pOF+1Wt53eXEFjvCCoQDuuleKowEm/IUHI7gIxB7aFKWS+eRI8rwDF5o2aCJWCWco
         xYZg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2f2o4oH30awFAD6nY3C0KdaBXUY9WnS0dvkUbUhKfSXj//vv0kexHGi2YUH3A4FVm6WZplgkyDT+dmw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIshbi0MaDGJh171tg2PV4qgXAzI5EnOYQAvZMqXNNyl6OyRa6
	7s0nLydCKm+P8pgCitzAjw/28q/EO2NBdsdq6pYn4oEewfsN5gE+IUsk7HVaTTQ9Uv3Z+w5LSXl
	pdBjA3/6Q5eqDoH4dc6BtHu093u5C1BI=
X-Gm-Gg: AR+sD11o/sTQ2BML8lkad72ZgtqFf/iC1n5W6C4p95LsGbQz0SP9x5j2L7wHFQwgZcr
	FVYsRY8scTs20sorIvUCRiXw6b+1lxjr/guhcVYW173qr7SiV9PqN2ILM8Yr3yBAuiXLKPyS5ab
	B3WAUnsOcWrGWRRdc+uJS8bxo/rH6bRkxdjrH6v9tgzwKiRUYMDyYKVRlQFCDLrQkCWDW9J5kST
	zP/RgExK8fSWAClZBNOyADZCgWynfCeM2jI9Ss8oQ6Hkq2BxiGAkTq/jUCIutOZ8Eqw5mmk+5xn
	uWAjcsrB5/8spUr7nYhsk2N5rQuzX7hWTz8XcDZUOQCuAEQ=
X-Received: by 2002:a05:6830:2106:b0:7e7:352:2f74 with SMTP id
 46e09a7af769-7f196ef1886mr25159269a34.13.1785840384046; Tue, 04 Aug 2026
 03:46:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728002048.19351-1-mikhail.v.gavrilov@gmail.com> <013a295e-faf4-4930-a101-27cfbf252178@leemhuis.info>
In-Reply-To: <013a295e-faf4-4930-a101-27cfbf252178@leemhuis.info>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 4 Aug 2026 15:46:12 +0500
X-Gm-Features: AUfX_myTz1AovWD-dmS8V3XgQ6MELh4yuEVac8YUyHla3LIgNjeCUwhYlkCyjFQ
Message-ID: <CABXGCsOAK92WxxLyYVfVrdEdLwvZh0JK5RJHn7J0X0mtCD3bkQ@mail.gmail.com>
Subject: Re: [PATCH mt76] wifi: mt76: mt792x: drop redundant napi_disable() in
 unregister path
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>, 
	Bert Karwatzki <spasswolf@web.de>, linux-kernel@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 2:29=E2=80=AFPM Thorsten Leemhuis <linux@leemhuis.in=
fo> wrote:
>
> TWIMC, there is another report about reboot/shutdown problems with mt76
> that was bisected to the commit mentioned above:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221818
>
> Pointed the reporter to this proposed fix two days ago, but no reply yet.
>

Thanks for the pointer - but please do not point people at this patch:
it is withdrawn.  I asked for it to be dropped on Jul 30, which was
before you sent them here, so you would have had no way of knowing.

Eric Biggers found that it introduces a use-after-free.  With the early
napi_disable() loops gone, the RX poll can reach mt76_token_release()
via PKT_TYPE_TXRX_NOTIFY and mt7921_mac_tx_free() while
mt76_connac2_tx_token_put() is running idr_destroy(&dev->token) outside
token_lock:

  https://lore.kernel.org/all/20260730050428.GA73812@sol/

So it fixes the hang and replaces it with something worse.  The diagnosis
in the commit message still holds - the hang is a double napi_disable(),
which is not idempotent - only the choice of where to fix it was wrong.

I am posting a plain revert of 13b7e6a96a00 instead, as [PATCH wireless],
since the regression is now in its second week with four independent
reporters and nobody has objected to reverting.  That restores the WARNs
in __netif_napi_del_locked() and page_pool_disable_direct_recycling() on
mt7915e with an MT7916, which is what 13b7e6a96a00 was fixing, but a WARN
is a much smaller problem than a machine that will not reboot.

Doing it properly means adding napi_disable() inside the drivers that
delete the NAPI instances - mt7915_unregister_device() and friends -
rather than in the shared mt76_dma_cleanup() where the timing is forced.
I am leaving that part to Nicolas: MT7916 is what he reported against and
I do not have that hardware.

For the bugzilla reporter: the revert should apply cleanly on top of
current mainline, and I will follow up with the lore link once it is out.

--=20
Thanks,
Mikhail
