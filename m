Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F8B131E3C
	for <regressions@lists.linux.dev>; Mon, 25 Mar 2024 16:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711383912; cv=none; b=g3uQ3YYp9u9L3PG78eVoQmEDqUeeCNbe3qgTb4YL7lnnCy4UpT7F/ZL4q1PcXNqIhmnJGiMLpqzdcip2LCy8icdnl/tRWPM3UvsitQ8saS0dot8o4oMixO14G7RwuAfYgTgYktjKnAgdw/+3OvVK+LyAWgcp1vzh+vAyYAUfTSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711383912; c=relaxed/simple;
	bh=fd6v3YipbAZg5gp4YXc+Et/ZlvKwwwlSiueLy2jek0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EEwNIbD+RqF2Gn/T+zttnQM2UZ8Y7JVRU2ZbLmCo6w9YI8zY4peXMXmtaPvLTXWxXZgpw/awZkXNX2Em51tAaNvhnyn9GcbioQrWIwZxDaP/qeNjyFGKHlxT3ZuEhCJJYhepL/Af7gEsGZycgW91D+EUbyD1Q6e5+BPodJujNJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PiHF+pWp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PiHF+pWp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A45C433C7
	for <regressions@lists.linux.dev>; Mon, 25 Mar 2024 16:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711383911;
	bh=fd6v3YipbAZg5gp4YXc+Et/ZlvKwwwlSiueLy2jek0s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PiHF+pWpDJmBKqJUODbV7zwfUUYblJzS7jRtBB3zpOpgBrxbjSJon2OUiLPav6FNq
	 7kasWKcUV9XkI6jNgJUyxkHnuz0EWyPbMD4x9Bca545mCM9YQIYM5jie+f9o++iJaI
	 uz0SZWCGhEuDftJ8c+Q8LUVy17AOdBMX9msiRMzKHUWmayMh+/T0MTnqxsJO8r9oTD
	 5cAC45QPMjiScZEjA++YdrOav7Wr4fXi4WK8XfyYcvtTeHulPrd2QnOmUXnd1pl4pX
	 vSJvvKv0LJLyPGzp9F5IPmAhvyLFVD8ZwV77v4QUg5zSOIbw8NQieIcdhYz7UOMCk7
	 6ek4r/IWFnUrg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d68651e253so75977491fa.0
        for <regressions@lists.linux.dev>; Mon, 25 Mar 2024 09:25:11 -0700 (PDT)
X-Gm-Message-State: AOJu0YwZzCL26/NKu697iC1QtosC4cT8UeW3+JL2lOmGn1DZWip7BjAM
	6abSFGs4+1e0B8A5cQq8ghpa6zl3nUo1gpDtfFlxIEHD9u6ZCFkwu73b3BLEuWwtJsKXuq6eic2
	Lywds/jKDPt1lv9p6esyL6yCrxQg=
X-Google-Smtp-Source: AGHT+IGbLavez2FXU8AxIus4yd3iMiBH8A2mEZKKwRZe49AtjRBE5serGnGMWb9QhwZklLaU5Tu7zLhnK+kXf84qe1w=
X-Received: by 2002:a2e:bc07:0:b0:2d6:d536:41ca with SMTP id
 b7-20020a2ebc07000000b002d6d53641camr3044886ljf.4.1711383909889; Mon, 25 Mar
 2024 09:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a99a831a-8ad5-4cb0-bff9-be637311f771@podgorny.cz>
 <CAMj1kXF7gaaARdyN=bVuXtJb_S=-_ewAavXHgN4DS36jxK8r6A@mail.gmail.com>
 <CAMj1kXEo-y1DfY_kBhwGU0xMkGp1PhdqGFmw6ToLePiZy4YgZQ@mail.gmail.com>
 <CAMj1kXFmgba8HyZ-yO7MsQBgOGjM10hZKWESBbfrUcjdhq0XsQ@mail.gmail.com>
 <225e9c2a-9889-4c9e-865c-9ef96bb266f3@podgorny.cz> <CAMj1kXG1Vgpp+ckwDww_4q2SF+kajUaoE3+qe5FzMkGyq-Lbag@mail.gmail.com>
 <CAMj1kXGZLs3MdFiK9jrkmWR+YPt50L5tuCJ+rLLTjVa3Grm6tw@mail.gmail.com>
 <61148405-2036-4994-9eef-45cbe6aa9adb@podgorny.cz> <CAMj1kXHn0qp2Qq1WfoT015ezjnzHLoy7=XVE_RY+6jsHzQ+gkA@mail.gmail.com>
 <35ae3208-a0ba-43a7-ac4c-6f770b3df405@podgorny.cz> <CAMj1kXHO_R4XpQ=To1ZW_yac_sjWFPnw7pjunn0UmraFDA2wCg@mail.gmail.com>
 <92898285-e85c-4e72-a179-70fb65349978@podgorny.cz> <CAMj1kXEfeC=O2_NFteJM+L1PqgR2MiXQEcFzmeemsgdKC8s7xQ@mail.gmail.com>
 <dd6e61ac-2356-4b97-85b4-b963a045361b@podgorny.cz> <CAMj1kXGcsEhf24QO1_4Wf99z=PR1cqdxim0Ttj-TqQijZOW=+Q@mail.gmail.com>
 <5e9b5508-cbec-4b81-a2e4-4a02e7c201dc@podgorny.cz>
In-Reply-To: <5e9b5508-cbec-4b81-a2e4-4a02e7c201dc@podgorny.cz>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 25 Mar 2024 18:24:58 +0200
X-Gmail-Original-Message-ID: <CAMj1kXF5TUNXVxcaY550_3JYvkGUZDRYtmPAKpbk64Ci8gpbqw@mail.gmail.com>
Message-ID: <CAMj1kXF5TUNXVxcaY550_3JYvkGUZDRYtmPAKpbk64Ci8gpbqw@mail.gmail.com>
Subject: Re: [REGRESSION] linux 6.6.18 and later fails to boot with "initramfs
 unpacking failed: invalid magic at start of compressed archive"
To: Radek Podgorny <radek@podgorny.cz>
Cc: regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: multipart/mixed; boundary="0000000000000623a306147e9ece"

--0000000000000623a306147e9ece
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Mar 2024 at 16:56, Radek Podgorny <radek@podgorny.cz> wrote:
>
> hi!
>
> patch 106 - does NOT work - result same as with patch 105 (Initramfs
> unpacking failed: broken padding
> patch 107 - WORKS - result same asi with patch 100 (full revert)
>


OK, we're making progress!

Please try the attached patches (try 0001 first and then 0001+0002)
instead of 107, and capture the output of the combination that
produces a working boot. There should be some diagnostic data on the
screen followed by a 10s delay.

--0000000000000623a306147e9ece
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-Dump-setup-header.patch"
Content-Disposition: attachment; filename="0001-Dump-setup-header.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lu75ruwr1>
X-Attachment-Id: f_lu75ruwr1

RnJvbSAxMWFkZDRhOGRhZTVjMzZiMzBkYTAxOGUzMGQ2MmE3ZmMxYTM3YmMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPgpEYXRl
OiBNb24sIDI1IE1hciAyMDI0IDE3OjE4OjMzICswMTAwClN1YmplY3Q6IFtQQVRDSCAxLzJdIER1
bXAgc2V0dXAgaGVhZGVyCgotLS0KIGRyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIveDg2LXN0
dWIuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIveDg2LXN0
dWIuYyBiL2RyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIveDg2LXN0dWIuYwppbmRleCA3YmNj
NTE3MDA0M2YuLmFhNDRiZGEyMzA1ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9maXJtd2FyZS9lZmkv
bGlic3R1Yi94ODYtc3R1Yi5jCisrKyBiL2RyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIveDg2
LXN0dWIuYwpAQCAtNDUwLDYgKzQ1MCwyMCBAQCB2b2lkIF9fbm9yZXR1cm4gZWZpX3N0dWJfZW50
cnkoZWZpX2hhbmRsZV90IGhhbmRsZSwKIAkJCSAgICAgICBlZmlfc3lzdGVtX3RhYmxlX3QgKnN5
c190YWJsZV9hcmcsCiAJCQkgICAgICAgc3RydWN0IGJvb3RfcGFyYW1zICpib290X3BhcmFtcyk7
CiAKK3N0YXRpYyB2b2lkIGR1bXBfYnVmKGNvbnN0IHU4ICpwLCBpbnQgc2l6ZSkKK3sKKwlmb3Ig
KGludCBpID0gMDsgaSA8IHNpemU7IGkrKykgeworCQljaGFyIHNbNF0sICpjID0gIiAuLiI7CisK
KwkJaWYgKCEoaSAlIDMyKSkKKwkJCWVmaV9wdXRzKCJcbiMjIyMjIik7CisJCWlmIChwW2ldKQor
CQkJc25wcmludGYoYyA9IHMsIDQsICIgJTAyeCIsIHBbaV0pOworCQllZmlfcHV0cyhjKTsKKwl9
CisJZWZpX3B1dHMoIlxuIik7Cit9CisKIC8qCiAgKiBCZWNhdXNlIHRoZSB4ODYgYm9vdCBjb2Rl
IGV4cGVjdHMgdG8gYmUgcGFzc2VkIGEgYm9vdF9wYXJhbXMgd2UKICAqIG5lZWQgdG8gY3JlYXRl
IG9uZSBvdXJzZWx2ZXMgKHVzdWFsbHkgdGhlIGJvb3Rsb2FkZXIgd291bGQgY3JlYXRlCkBAIC00
NjAsNiArNDc0LDcgQEAgZWZpX3N0YXR1c190IF9fZWZpYXBpIGVmaV9wZV9lbnRyeShlZmlfaGFu
ZGxlX3QgaGFuZGxlLAogewogCXN0YXRpYyBzdHJ1Y3QgYm9vdF9wYXJhbXMgYm9vdF9wYXJhbXMg
X19wYWdlX2FsaWduZWRfYnNzOwogCXN0cnVjdCBzZXR1cF9oZWFkZXIgKmhkciA9ICZib290X3Bh
cmFtcy5oZHI7CisJdm9pZCAqaW1hZ2VfYmFzZTsKIAllZmlfZ3VpZF90IHByb3RvID0gTE9BREVE
X0lNQUdFX1BST1RPQ09MX0dVSUQ7CiAJaW50IG9wdGlvbnNfc2l6ZSA9IDA7CiAJZWZpX3N0YXR1
c190IHN0YXR1czsKQEAgLTQ3Nyw2ICs0OTIsMTYgQEAgZWZpX3N0YXR1c190IF9fZWZpYXBpIGVm
aV9wZV9lbnRyeShlZmlfaGFuZGxlX3QgaGFuZGxlLAogCQllZmlfZXhpdChoYW5kbGUsIHN0YXR1
cyk7CiAJfQogCisJZHVtcF9idWYoKHU4ICopaGRyLCBzaXplb2YoKmhkcikpOworCisJaW1hZ2Vf
YmFzZSA9IGVmaV90YWJsZV9hdHRyKGltYWdlLCBpbWFnZV9iYXNlKTsKKworCS8qIENvcHkgdGhl
IHNldHVwIGhlYWRlciBmcm9tIHRoZSBzZWNvbmQgc2VjdG9yIHRvIGJvb3RfcGFyYW1zICovCisJ
bWVtY3B5KCZoZHItPmp1bXAsIGltYWdlX2Jhc2UgKyA1MTIsCisJICAgICAgIHNpemVvZihzdHJ1
Y3Qgc2V0dXBfaGVhZGVyKSAtIG9mZnNldG9mKHN0cnVjdCBzZXR1cF9oZWFkZXIsIGp1bXApKTsK
KworCWR1bXBfYnVmKCh1OCAqKWhkciwgc2l6ZW9mKCpoZHIpKTsKKwogCS8qIEFzc2lnbiB0aGUg
c2V0dXBfaGVhZGVyIGZpZWxkcyB0aGF0IHRoZSBrZXJuZWwgYWN0dWFsbHkgY2FyZXMgYWJvdXQg
Ki8KIAloZHItPnJvb3RfZmxhZ3MJPSAxOwogCWhkci0+dmlkX21vZGUJPSAweGZmZmY7CkBAIC00
OTEsNiArNTE2LDggQEAgZWZpX3N0YXR1c190IF9fZWZpYXBpIGVmaV9wZV9lbnRyeShlZmlfaGFu
ZGxlX3QgaGFuZGxlLAogCWVmaV9zZXRfdTY0X3NwbGl0KCh1bnNpZ25lZCBsb25nKWNtZGxpbmVf
cHRyLCAmaGRyLT5jbWRfbGluZV9wdHIsCiAJCQkgICZib290X3BhcmFtcy5leHRfY21kX2xpbmVf
cHRyKTsKIAorCWR1bXBfYnVmKCh1OCAqKWhkciwgc2l6ZW9mKCpoZHIpKTsKKwogCWVmaV9zdHVi
X2VudHJ5KGhhbmRsZSwgc3lzX3RhYmxlX2FyZywgJmJvb3RfcGFyYW1zKTsKIAkvKiBub3QgcmVh
Y2hlZCAqLwogCkBAIC05MDgsNiArOTM1LDggQEAgdm9pZCBfX25vcmV0dXJuIGVmaV9zdHViX2Vu
dHJ5KGVmaV9oYW5kbGVfdCBoYW5kbGUsCiAJCQkJICAmYm9vdF9wYXJhbXMtPmV4dF9yYW1kaXNr
X3NpemUpOwogCX0KIAorCWR1bXBfYnVmKCh1OCAqKWhkciwgc2l6ZW9mKCpoZHIpKTsKKwllZmlf
YnNfY2FsbChzdGFsbCwgMTAgKiBFRklfVVNFQ19QRVJfU0VDKTsKIAogCS8qCiAJICogSWYgdGhl
IGJvb3QgbG9hZGVyIGdhdmUgdXMgYSB2YWx1ZSBmb3Igc2VjdXJlX2Jvb3QgdGhlbiB3ZSB1c2Ug
dGhhdCwKLS0gCjIuNDQuMC4zOTYuZzZlNzkwZGJlMzYtZ29vZwoK
--0000000000000623a306147e9ece
Content-Type: text/x-patch; charset="US-ASCII"; name="0002-Set-some-header-flags.patch"
Content-Disposition: attachment; filename="0002-Set-some-header-flags.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lu75ruwo0>
X-Attachment-Id: f_lu75ruwo0

RnJvbSAzOTdjMGEzOGE4MzY3YWNkOWJiZWJkMmNjZDhkYTg3MzcxNTgyODVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPgpEYXRl
OiBNb24sIDI1IE1hciAyMDI0IDE3OjIyOjIzICswMTAwClN1YmplY3Q6IFtQQVRDSCAyLzJdIFNl
dCBzb21lIGhlYWRlciBmbGFncwoKLS0tCiBkcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL3g4
Ni1zdHViLmMgfCAxMSArKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL3g4Ni1zdHViLmMg
Yi9kcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL3g4Ni1zdHViLmMKaW5kZXggYWE0NGJkYTIz
MDVmLi4wN2IyMzdkYWZhMDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0
dWIveDg2LXN0dWIuYworKysgYi9kcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL3g4Ni1zdHVi
LmMKQEAgLTUwNSw2ICs1MDUsNyBAQCBlZmlfc3RhdHVzX3QgX19lZmlhcGkgZWZpX3BlX2VudHJ5
KGVmaV9oYW5kbGVfdCBoYW5kbGUsCiAJLyogQXNzaWduIHRoZSBzZXR1cF9oZWFkZXIgZmllbGRz
IHRoYXQgdGhlIGtlcm5lbCBhY3R1YWxseSBjYXJlcyBhYm91dCAqLwogCWhkci0+cm9vdF9mbGFn
cwk9IDE7CiAJaGRyLT52aWRfbW9kZQk9IDB4ZmZmZjsKKwloZHItPmJvb3RfZmxhZwk9IDB4QUE1
NTsKIAogCWhkci0+dHlwZV9vZl9sb2FkZXIgPSAweDIxOwogCkBAIC01MTYsNiArNTE3LDE2IEBA
IGVmaV9zdGF0dXNfdCBfX2VmaWFwaSBlZmlfcGVfZW50cnkoZWZpX2hhbmRsZV90IGhhbmRsZSwK
IAllZmlfc2V0X3U2NF9zcGxpdCgodW5zaWduZWQgbG9uZyljbWRsaW5lX3B0ciwgJmhkci0+Y21k
X2xpbmVfcHRyLAogCQkJICAmYm9vdF9wYXJhbXMuZXh0X2NtZF9saW5lX3B0cik7CiAKKwloZHIt
PnJhbWRpc2tfaW1hZ2UgPSAwOworCWhkci0+cmFtZGlza19zaXplID0gMDsKKworCS8qCisJICog
RGlzcmVnYXJkIGFueSBzZXR1cCBkYXRhIHRoYXQgd2FzIHByb3ZpZGVkIGJ5IHRoZSBib290bG9h
ZGVyOgorCSAqIHNldHVwX2RhdGEgY291bGQgYmUgcG9pbnRpbmcgYW55d2hlcmUsIGFuZCB3ZSBo
YXZlIG5vIHdheSBvZgorCSAqIGF1dGhlbnRpY2F0aW5nIG9yIHZhbGlkYXRpbmcgdGhlIHBheWxv
YWQuCisJICovCisJaGRyLT5zZXR1cF9kYXRhID0gMDsKKwogCWR1bXBfYnVmKCh1OCAqKWhkciwg
c2l6ZW9mKCpoZHIpKTsKIAogCWVmaV9zdHViX2VudHJ5KGhhbmRsZSwgc3lzX3RhYmxlX2FyZywg
JmJvb3RfcGFyYW1zKTsKLS0gCjIuNDQuMC4zOTYuZzZlNzkwZGJlMzYtZ29vZwoK
--0000000000000623a306147e9ece--
