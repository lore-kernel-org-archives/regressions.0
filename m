Received: from mail-oi2-f0.google.com (mail-oi2-f0.google.com [74.125.231.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4911F37B012
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426601; cv=none; b=pKOsU8Y7ZyB7OgVjBlFYBUELJf68zzeyUmLLwUm6IID4h0R2T7fa2SA0kDwWVD3F6SrKLWl86IPKa6OhevDzRvFac/h1szakCGJ+obVx7jqD2+gNZbxUqx5x2kl2zUjKM9XQAaRK0I6sT/jnnQhCF2J36nMWg85bhOoX09VltF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426601; c=relaxed/simple;
	bh=qM6E7GRAC7CpSrHiKaxJspKVrxfIbuUHQVV1WjGirKQ=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:From:To:Cc:
	 References:In-Reply-To; b=XywRoxU9wLbXUQTa8x8nLXALpShv1RThkSKxaF8/ManFdpB8s2NQb0qEujGwiVLzj8XO3R2XZBVJp8YtrvzEuedJwDv+EyM/N3ybz9xZUXA4Whco648l+x/pmNVEXVq/rVd5LfpLraOlJK+0zHp5G/0beHwZEdqo8tn4/iWQ5Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=j4aF7OA+; arc=none smtp.client-ip=74.125.231.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="j4aF7OA+"
Received: by mail-oi2-f0.google.com with SMTP id 5614622812f47-4a49b13b745so9651b6e.0
        for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 08:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785426597; x=1786031397; darn=lists.linux.dev;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yjOhowXdN1QUI6QEDkwBUCrNL5L9BnZR/0e5f1pErBM=;
        b=j4aF7OA+Tvf7risRosqX5Ld3yjzIHWis7MiiTZhzbNnDEEuNduAsXaLICO3E8u7Zqy
         irIfmD8YbK+5mGGp3aTry04DyGXm48DnsuDQsSiTgrG+GRG1Zmh+aDaojUYJ0mOg6YJB
         3YTTJ/22ib4UD8nNJy3Shzlb23uukDZCBI1HYxXrWxaAZuif7dOlZwZwp7eqakRE6gr+
         lm2RYFyFj8lShI5D73JNPDJrbS7SMbpXxjxdoU5+OZRrQIRw8KA6fbxS4K0yUJSniKCR
         zlGakcLIr6z5HoD8gXGlrq82ekIWxKnJzEhOguhxo/fi/WeWugE2bc7Myn6+HSLc9Cqi
         IacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785426597; x=1786031397;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjOhowXdN1QUI6QEDkwBUCrNL5L9BnZR/0e5f1pErBM=;
        b=EsnEd2K64z3NxFJ8pGjFgzGs5VmXf1/Iio0e0YkBPSqb9vEsW+HKUEa4XZ5GHAZs2K
         9xLECyLQwBixADLUJluM5VboDTdNhFMkAAg+f/oQb5q8v/0hshOEfrug1Pw5v3XrMeKg
         R038Z4a1pCX1CovSdp9rU7KPy+zFfLBVMUDt+0cB3LuFVHg1Z3I+VqKQuCo+t+iQs9by
         Uupt2oHkyxeZ0k/40glFy/oB85L2z9b+JbkSRsctu526nFdTEkMrNZ10fGo5SXJPXyC6
         fzTfeLhrSLcbP6zwjQGuiEQLtNGUzM0vTwnMpz7j3gNyeCBXl93VYJIaK1HyIDhQxV/g
         Q4Vg==
X-Forwarded-Encrypted: i=1; AHgh+RopXBYbDy3BrNhCeIIilT5TKM+hSUQOYS5/GXHOl2C5N27D7HPebBGgLewXH2plTs5zOy9ZKI3xxH0jlg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAIvu+F6ZfFFyRNGG50Jfy2xVT0hbzVfswTz263Z16kdwgQ1oo
	81O6WVRsFFFTKB865afajT+acavWDKIewyqfT5xe3RJ6iXiTxdVrolDqKts6Y85tvKI=
X-Gm-Gg: AR+sD114IXrnhZ8ugnfS03sccDz6wwlJ8UqMOyTeshAVcBlikg0YYRsjkUGkaDtOhAW
	TgazZLbP33GAbGo8sdGwrue/bz9LWTORRlZEp7JCQMdF54VZmaBCiNv6HJ0axg1qI6a0TmkciJy
	kNEuAzcWxzOThaeU+5LfXWnSOBSgdcsEwh6Ro2tWU2h+m4U8miBXIHFrHNzjyTuBH+5ebFoAzY8
	+I0k1jvWLk+VXUtYs+WueNih8AL1mnHNlE7SZptdVH4YIe4951/JrigMNunDjVsBsHMXIloTTpA
	R1kZh+J6We2sQ5pOvqCwhlUccr18OJydUgkrSpwfn12HCmvjVPxn+wHnHy82pCsKLz11jVIR/6T
	8618DL5z6WNV5iPoDNLyY7QeZ5x6NRi5NwMRf4/poPv3q0WgNxuhIh+OZP1gSvpIH4QDzfu+j1N
	bC5kEo0h6FHLQdAcTKpjKtjhLmgF1AJP5g6kbNaYtrgsugaPELnej3eH77rAVl5llg0yFfrSjI1
	yin24wHdElboZ1YQGyr0z9r9+dzIZGaw2yQV9u9pCHGNg==
X-Received: by 2002:a05:6808:3084:b0:496:6b1:cc77 with SMTP id 5614622812f47-4ad9538e2d3mr972579b6e.32.1785426596906;
        Thu, 30 Jul 2026 08:49:56 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6ed31058sm4502841b6e.8.2026.07.30.08.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 08:49:55 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------dWaau59nsj0xtshHvNqcT01N"
Message-ID: <aa84c27c-d9c5-469c-9e95-9f8dd3fe47cb@kernel.dk>
Date: Thu, 30 Jul 2026 09:49:54 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] io_uring/futex: scalar wait/wake slowdown after
 079afb081c42
From: Jens Axboe <axboe@kernel.dk>
To: Chengfeng Lin <lin2530632123@gmail.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, Robert Morris
 <rtm@csail.mit.edu>, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <CANGjgdn=R_qyUdE=j9za+vkmqcxacbP-84OHXF4nZ4ho9qRyVg@mail.gmail.com>
 <e679211f-f036-4cd4-887a-430aa9376fc1@kernel.dk>
Content-Language: en-US
In-Reply-To: <e679211f-f036-4cd4-887a-430aa9376fc1@kernel.dk>

This is a multi-part message in MIME format.
--------------dWaau59nsj0xtshHvNqcT01N
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/30/26 8:34 AM, Jens Axboe wrote:
> On 7/30/26 4:42 AM, Chengfeng Lin wrote:
>> Hi Jens,
>>
>> I tested 079afb081c42 against its direct parent on bare metal. In a narrow
>> scalar io_uring futex wait/wake workload, the child was 9.27% slower. A
>> separate 338-line standalone reproduced the result at 10.02%. All compared
>> kernels actually ran with preempt=full.
>>
>> #regzbot introduced: 079afb081c4288e94d5e4223d3eb6306d853c68b
>> #regzbot title: io_uring scalar futex wait/wake slowdown
>>
>> This is a focused synthetic microbenchmark, not an application benchmark. It
>> uses one raw-UAPI ring and 32 cacheline-separated private futex words on one
>> pinned P-core. Each timed cycle submits 32 scalar IORING_OP_FUTEX_WAIT
>> requests, then 32 scalar IORING_OP_FUTEX_WAKE requests, and drains exactly 64
>> CQEs. Every wait must return 0 and every wake must return 1.
>>
>> I used a fresh boot for each point:
>>
>>   6a8118a77eec parent A -> 079afb081c42 child -> 6a8118a77eec parent B
>>
>> Each point had 3 warm-up rounds and 15 measured rounds. Every measured round
>> ran 512 cycles, or 16,384 wait/wake pairs. The results in ns/pair were:
>>
>>   implementation   parent A    child    parent B    child vs midpoint
>>   formal              180.079  196.647     179.856        +9.268%
>>   standalone          180.171  197.856     179.502       +10.020%
>>
>> For the formal source, dropping the first measured round gave +9.269%. Parent
>> drift was -0.124%, and the maximum CV was 0.169%. The standalone drop-first
>> result was +9.996%, with -0.371% parent drift. All 90 scalar timing rows
>> passed the CQE, result, timeout, overflow, outstanding-request, and CPU
>> checks.
>>
>> An untimed child trace also hit io_futex_prep(), io_futex_wait(),
>> io_futex_wake(), and io_futex_complete() with the expected request counts.
>>
>> A matched WAITV -> WAKE profile changed by only +1.385%, below my preregistered
>> 5% signal gate, so my claim is limited to scalar wait/wake.
>>
>> I understand that 079afb fixes the exit-time use-after-free by keeping pending
>> private futex waits visible to cancellation before their mm state disappears.
>> Scalar WAIT and WAKE both use io_futex_prep(), so in the child both sides of
>> each measured pair execute the added tracking call. I am not suggesting a
>> revert.
>>
>> Is this per-request cost an expected trade-off for the lifetime fix, or could
>> the same exit/mm-lifetime guarantee be retained with cheaper tracking?
>>
>> Evidence bundle:
>>
>>   https://github.com/lcf0399/linux-regression-evidence/tree/65c8cbf86f40cbe759e3f7db1d29d152ba03a8f2/io-uring-futex-inflight-wait-wake
>>
>> Standalone reproducer:
>>
>>   https://github.com/lcf0399/linux-regression-evidence/tree/65c8cbf86f40cbe759e3f7db1d29d152ba03a8f2/io-uring-futex-inflight-wait-wake/reproducer
> 
> Great report, thanks for that! I'll take a look at this. The inflight
> tracking is a bit of a big hammer for sure for this, and it isn't even
> needed on the wake side. Can you tell me what parameters you're using
> for the reproducers?

Try with these two patches.

-- 
Jens Axboe

--------------dWaau59nsj0xtshHvNqcT01N
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-io_uring-futex-only-mark-private-futex-waits-as-infl.patch"
Content-Disposition: attachment;
 filename*0="0002-io_uring-futex-only-mark-private-futex-waits-as-infl.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBiNDdmMTRmMzAyNWY5MDhkYzcxOTMyYTJhZTRiODJmZmNhZDJjZDM3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+CkRh
dGU6IFRodSwgMzAgSnVsIDIwMjYgMDY6NTA6NDcgLTA2MDAKU3ViamVjdDogW1BBVENIIDIv
Ml0gaW9fdXJpbmcvZnV0ZXg6IG9ubHkgbWFyayBwcml2YXRlIGZ1dGV4IHdhaXRzIGFzIGlu
ZmxpZ2h0CgpJbmZsaWdodCB0cmFja2luZyBvZiBmdXRleCB3YWl0IHJlcXVlc3RzIGV4aXN0
cyB0byBlbnN1cmUgdGhhdCBkb19leGl0KCkKLT4gaW9fdXJpbmdfZmlsZXNfY2FuY2VsKCkg
Y2FuY2VscyB0aGVtIGJlZm9yZSB0aGUgbW0gZ29lcyBhd2F5LCBhcyBhCnByaXZhdGUgZnV0
ZXggd2FpdCBkZXBlbmRzIG9uIHRoZSBtbSBwcml2YXRlIGZ1dGV4IGhhc2ggc3RheWluZyBh
bGl2ZQpmb3IgdGhlIGR1cmF0aW9uIG9mIHRoZSByZXF1ZXN0LgoKU2hhcmVkIGZ1dGV4ZXMg
aGF2ZSBubyBzdWNoIGRlcGVuZGVuY3kuIEEgRkxBR1NfU0hBUkVEIHJlcXVlc3QgYWx3YXlz
CnJlc29sdmVzIHRvIGVpdGhlciBhbiBpbm9kZSBiYXNlZCBrZXkgb3IgYW4gbW0tc2hhcmVk
IGtleSwgYm90aCBvZiB3aGljaApmYWlsIGZ1dGV4X2tleV9pc19wcml2YXRlKCkgYW5kIGhl
bmNlIGFsd2F5cyBoYXNoIGludG8gdGhlIGdsb2JhbCBmdXRleApoYXNoLCB3aG9zZSBsaWZl
dGltZSBpc24ndCB0aWVkIHRvIHRoZSBtbS4KCk9ubHkgbWFyayB2ZWN0b3JlZCBmdXRleCB3
YWl0cyBhcyBpbmZsaWdodCBpZiB0aGUgZnV0ZXggaXMgcHJpdmF0ZS4KCkNjOiBzdGFibGVA
dmdlci5rZXJuZWwub3JnCkZpeGVzOiAwNzlhZmIwODFjNDIgKCJpb191cmluZy9mdXRleDog
bWFyayB3YWl0IHJlcXVlc3RzIGFzIGluZmxpZ2h0IikKTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvaW8tdXJpbmcvQ0FOR2pnZG49Ul9xeVVkRT1qOXphK3ZrbXFjeGFjYlAtODRP
SFhGNG5aNGhvOXFSeVZnQG1haWwuZ21haWwuY29tLwpTaWduZWQtb2ZmLWJ5OiBKZW5zIEF4
Ym9lIDxheGJvZUBrZXJuZWwuZGs+Ci0tLQogaW9fdXJpbmcvZnV0ZXguYyB8IDE3ICsrKysr
KysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pb191cmluZy9mdXRleC5jIGIvaW9fdXJpbmcvZnV0
ZXguYwppbmRleCBlZWEwNDI1ZjJiY2IuLmYwZDgwYTQ0NGY0NSAxMDA2NDQKLS0tIGEvaW9f
dXJpbmcvZnV0ZXguYworKysgYi9pb191cmluZy9mdXRleC5jCkBAIC0xNTQsMTQgKzE1NCwx
NiBAQCBpbnQgaW9fZnV0ZXhfcHJlcChzdHJ1Y3QgaW9fa2lvY2IgKnJlcSwgY29uc3Qgc3Ry
dWN0IGlvX3VyaW5nX3NxZSAqc3FlKQogCiBpbnQgaW9fZnV0ZXhfd2FpdF9wcmVwKHN0cnVj
dCBpb19raW9jYiAqcmVxLCBjb25zdCBzdHJ1Y3QgaW9fdXJpbmdfc3FlICpzcWUpCiB7CisJ
c3RydWN0IGlvX2Z1dGV4ICppb2YgPSBpb19raW9jYl90b19jbWQocmVxLCBzdHJ1Y3QgaW9f
ZnV0ZXgpOwogCWludCByZXQ7CiAKIAlyZXQgPSBpb19mdXRleF9wcmVwKHJlcSwgc3FlKTsK
IAlpZiAodW5saWtlbHkocmV0KSkKIAkJcmV0dXJuIHJldDsKIAotCS8qIE1hcmsgYXMgaW5m
bGlnaHQsIHNvIGZpbGUgZXhpdCBjYW5jZWxhdGlvbiB3aWxsIGZpbmQgaXQgKi8KLQlpb19y
ZXFfdHJhY2tfaW5mbGlnaHQocmVxKTsKKwkvKiBpbmZsaWdodCB0cmFja2luZyBvbmx5IG5l
ZWRlZCBmb3IgbW0gcHJpdmF0ZSBoYXNoICovCisJaWYgKCEoaW9mLT5mdXRleF9mbGFncyAm
IEZMQUdTX1NIQVJFRCkpCisJCWlvX3JlcV90cmFja19pbmZsaWdodChyZXEpOwogCXJldHVy
biAwOwogfQogCkBAIC0xODYsNiArMTg4LDcgQEAgaW50IGlvX2Z1dGV4dl9wcmVwKHN0cnVj
dCBpb19raW9jYiAqcmVxLCBjb25zdCBzdHJ1Y3QgaW9fdXJpbmdfc3FlICpzcWUpCiB7CiAJ
c3RydWN0IGlvX2Z1dGV4ICppb2YgPSBpb19raW9jYl90b19jbWQocmVxLCBzdHJ1Y3QgaW9f
ZnV0ZXgpOwogCXN0cnVjdCBpb19mdXRleHZfZGF0YSAqaWZkOworCXVuc2lnbmVkIGludCBp
OwogCWludCByZXQ7CiAKIAkvKiBObyBmbGFncyBvciBtYXNrIHN1cHBvcnRlZCBmb3Igd2Fp
dHYgKi8KQEAgLTIxMCw4ICsyMTMsMTQgQEAgaW50IGlvX2Z1dGV4dl9wcmVwKHN0cnVjdCBp
b19raW9jYiAqcmVxLCBjb25zdCBzdHJ1Y3QgaW9fdXJpbmdfc3FlICpzcWUpCiAJCXJldHVy
biByZXQ7CiAJfQogCi0JLyogTWFyayBhcyBpbmZsaWdodCwgc28gZmlsZSBleGl0IGNhbmNl
bGF0aW9uIHdpbGwgZmluZCBpdCAqLwotCWlvX3JlcV90cmFja19pbmZsaWdodChyZXEpOwor
CS8qIGluZmxpZ2h0IHRyYWNraW5nIG9ubHkgbmVlZGVkIGZvciBtbSBwcml2YXRlIGhhc2gg
Ki8KKwlmb3IgKGkgPSAwOyBpIDwgaW9mLT5mdXRleF9ucjsgaSsrKSB7CisJCWlmICghKGlm
ZC0+ZnV0ZXh2W2ldLncuZmxhZ3MgJiBGTEFHU19TSEFSRUQpKSB7CisJCQlpb19yZXFfdHJh
Y2tfaW5mbGlnaHQocmVxKTsKKwkJCWJyZWFrOworCQl9CisJfQorCiAJaW9mLT5mdXRleHZf
dW5xdWV1ZWQgPSAwOwogCXJlcS0+ZmxhZ3MgfD0gUkVRX0ZfQVNZTkNfREFUQTsKIAlyZXEt
PmFzeW5jX2RhdGEgPSBpZmQ7Ci0tIAoyLjUzLjAKCg==
--------------dWaau59nsj0xtshHvNqcT01N
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-io_uring-futex-don-t-mark-futex-wake-requests-as-inf.patch"
Content-Disposition: attachment;
 filename*0="0001-io_uring-futex-don-t-mark-futex-wake-requests-as-inf.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBhYmQwODZhMzhlYTg0NDJkODdiYmVkYzBlZDk0NGZlY2JhOTY0YmU4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+CkRh
dGU6IFRodSwgMzAgSnVsIDIwMjYgMDY6NTA6MTMgLTA2MDAKU3ViamVjdDogW1BBVENIIDEv
Ml0gaW9fdXJpbmcvZnV0ZXg6IGRvbid0IG1hcmsgZnV0ZXggd2FrZSByZXF1ZXN0cyBhcwog
aW5mbGlnaHQKCkNvbW1pdCAwNzlhZmIwODFjNDIgKCJpb191cmluZy9mdXRleDogbWFyayB3
YWl0IHJlcXVlc3RzIGFzIGluZmxpZ2h0IikKYWRkZWQgaW5mbGlnaHQgdHJhY2tpbmcgdG8g
ZW5zdXJlIHRoYXQgZG9fZXhpdCgpIC0+CmlvX3VyaW5nX2ZpbGVzX2NhbmNlbCgpIGZpbmRz
IGFuZCBjYW5jZWxzIHBlbmRpbmcgZnV0ZXggd2FpdHMgYmVmb3JlIHRoZQptbSBnb2VzIGF3
YXksIGFzIGEgcHJpdmF0ZSBmdXRleCB3YWl0IGRlcGVuZHMgb24gdGhlIG1tIHByaXZhdGUg
ZnV0ZXgKaGFzaCBzdGF5aW5nIGFsaXZlIGZvciB0aGUgZHVyYXRpb24gb2YgdGhlIHJlcXVl
c3QuIEhvd2V2ZXIsIGFzCmlvX2Z1dGV4X3ByZXAoKSBpcyBzaGFyZWQgYmV0d2VlbiBGVVRF
WF9XQUlUIGFuZCBGVVRFWF9XQUtFLCB3YWtlCnJlcXVlc3RzIGdvdCBtYXJrZWQgYXMgaW5m
bGlnaHQgYXMgd2VsbC4KCkEgZnV0ZXggd2FrZSBleGVjdXRlcyBmdWxseSBpbmxpbmUgYXQg
aXNzdWUgdGltZSBhbmQgbmV2ZXIgZGVwZW5kcyBvbgp0aGUgbW0gc3RheWluZyBhbGl2ZSBh
ZnRlciBjb21wbGV0aW9uLCBoZW5jZSB0aGVyZSdzIG5vIG5lZWQgdG8gdHJhY2sKaXQuIEtp
bGwgaXQuCgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpGaXhlczogMDc5YWZiMDgxYzQy
ICgiaW9fdXJpbmcvZnV0ZXg6IG1hcmsgd2FpdCByZXF1ZXN0cyBhcyBpbmZsaWdodCIpClJl
cG9ydGVkLWJ5OiBDaGVuZ2ZlbmcgTGluIDxsaW4yNTMwNjMyMTIzQGdtYWlsLmNvbT4KTGlu
azogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvaW8tdXJpbmcvQ0FOR2pnZG49Ul9xeVVkRT1q
OXphK3ZrbXFjeGFjYlAtODRPSFhGNG5aNGhvOXFSeVZnQG1haWwuZ21haWwuY29tLwpTaWdu
ZWQtb2ZmLWJ5OiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+Ci0tLQogaW9fdXJpbmcv
ZnV0ZXguYyB8IDExICsrKysrKysrKysrCiBpb191cmluZy9mdXRleC5oIHwgIDEgKwogaW9f
dXJpbmcvb3BkZWYuYyB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pb191cmluZy9mdXRleC5jIGIvaW9f
dXJpbmcvZnV0ZXguYwppbmRleCA5MDY3MDFiM2M1YzYuLmVlYTA0MjVmMmJjYiAxMDA2NDQK
LS0tIGEvaW9fdXJpbmcvZnV0ZXguYworKysgYi9pb191cmluZy9mdXRleC5jCkBAIC0xNDks
NiArMTQ5LDE3IEBAIGludCBpb19mdXRleF9wcmVwKHN0cnVjdCBpb19raW9jYiAqcmVxLCBj
b25zdCBzdHJ1Y3QgaW9fdXJpbmdfc3FlICpzcWUpCiAJICAgICFmdXRleF92YWxpZGF0ZV9p
bnB1dChpb2YtPmZ1dGV4X2ZsYWdzLCBpb2YtPmZ1dGV4X21hc2spKQogCQlyZXR1cm4gLUVJ
TlZBTDsKIAorCXJldHVybiAwOworfQorCitpbnQgaW9fZnV0ZXhfd2FpdF9wcmVwKHN0cnVj
dCBpb19raW9jYiAqcmVxLCBjb25zdCBzdHJ1Y3QgaW9fdXJpbmdfc3FlICpzcWUpCit7CisJ
aW50IHJldDsKKworCXJldCA9IGlvX2Z1dGV4X3ByZXAocmVxLCBzcWUpOworCWlmICh1bmxp
a2VseShyZXQpKQorCQlyZXR1cm4gcmV0OworCiAJLyogTWFyayBhcyBpbmZsaWdodCwgc28g
ZmlsZSBleGl0IGNhbmNlbGF0aW9uIHdpbGwgZmluZCBpdCAqLwogCWlvX3JlcV90cmFja19p
bmZsaWdodChyZXEpOwogCXJldHVybiAwOwpkaWZmIC0tZ2l0IGEvaW9fdXJpbmcvZnV0ZXgu
aCBiL2lvX3VyaW5nL2Z1dGV4LmgKaW5kZXggZDc4OWZjZjcxNWUzLi45ODdkYjNmMmM2ZDkg
MTAwNjQ0Ci0tLSBhL2lvX3VyaW5nL2Z1dGV4LmgKKysrIGIvaW9fdXJpbmcvZnV0ZXguaApA
QCAtMyw2ICszLDcgQEAKICNpbmNsdWRlICJjYW5jZWwuaCIKIAogaW50IGlvX2Z1dGV4X3By
ZXAoc3RydWN0IGlvX2tpb2NiICpyZXEsIGNvbnN0IHN0cnVjdCBpb191cmluZ19zcWUgKnNx
ZSk7CitpbnQgaW9fZnV0ZXhfd2FpdF9wcmVwKHN0cnVjdCBpb19raW9jYiAqcmVxLCBjb25z
dCBzdHJ1Y3QgaW9fdXJpbmdfc3FlICpzcWUpOwogaW50IGlvX2Z1dGV4dl9wcmVwKHN0cnVj
dCBpb19raW9jYiAqcmVxLCBjb25zdCBzdHJ1Y3QgaW9fdXJpbmdfc3FlICpzcWUpOwogaW50
IGlvX2Z1dGV4X3dhaXQoc3RydWN0IGlvX2tpb2NiICpyZXEsIHVuc2lnbmVkIGludCBpc3N1
ZV9mbGFncyk7CiBpbnQgaW9fZnV0ZXh2X3dhaXQoc3RydWN0IGlvX2tpb2NiICpyZXEsIHVu
c2lnbmVkIGludCBpc3N1ZV9mbGFncyk7CmRpZmYgLS1naXQgYS9pb191cmluZy9vcGRlZi5j
IGIvaW9fdXJpbmcvb3BkZWYuYwppbmRleCA0ZTU4ZWIxMzQ0ZWEuLmNmM2FhMjI0MmNkNyAx
MDA2NDQKLS0tIGEvaW9fdXJpbmcvb3BkZWYuYworKysgYi9pb191cmluZy9vcGRlZi5jCkBA
IC00NjcsNyArNDY3LDcgQEAgY29uc3Qgc3RydWN0IGlvX2lzc3VlX2RlZiBpb19pc3N1ZV9k
ZWZzW10gPSB7CiAJfSwKIAlbSU9SSU5HX09QX0ZVVEVYX1dBSVRdID0gewogI2lmIGRlZmlu
ZWQoQ09ORklHX0ZVVEVYKQotCQkucHJlcAkJCT0gaW9fZnV0ZXhfcHJlcCwKKwkJLnByZXAJ
CQk9IGlvX2Z1dGV4X3dhaXRfcHJlcCwKIAkJLmlzc3VlCQkJPSBpb19mdXRleF93YWl0LAog
I2Vsc2UKIAkJLnByZXAJCQk9IGlvX2VvcG5vdHN1cHBfcHJlcCwKLS0gCjIuNTMuMAoK

--------------dWaau59nsj0xtshHvNqcT01N--
