Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103721C6AB
	for <regressions@lists.linux.dev>; Fri, 22 Mar 2024 17:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711128207; cv=none; b=NlYxU0EzBbg+PW5Vftk/2YynZJ3ZQ8p/mF1HSXWc+nmt2oO+8d0i65lUMuCVaBC0mv/f7oFsouGzF6G35fr17d6VZ92NBW6Qz5EgeIc5nWWMJl04xf9rwZIJgY2VPpO9dpy0rFhJwm7CUQw06j6DPAy86eqHxTvlu5RtskVuSm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711128207; c=relaxed/simple;
	bh=4StYodAGbY3dKNDDuPd/DL+LCivJR6So0Ja0bmlrp8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hFOBnWyKZqFz96da4jZkvmx2E1fOrPE5PSKpI+BU5fHRlTmyl8k3iBH657ZSvQHdDGuoRKGwDiGJCSZq8mxcscZTPnrm5Ord151bcpI+kwjsoXiBNEFtIKcn/T+www65w8nR1df9QSlFx4xrX7Vx046d8vWisN9jArKpRovTBCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4ET7tTW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4ET7tTW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BEC9C433C7
	for <regressions@lists.linux.dev>; Fri, 22 Mar 2024 17:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711128206;
	bh=4StYodAGbY3dKNDDuPd/DL+LCivJR6So0Ja0bmlrp8w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h4ET7tTWyxbJIIYzoADF8Y57wRPv8mtZSppJ5Ac1aBWbEP+Gsv5gu+KQXKggLu9wd
	 AtNRMdf/Yif8Xw8qv3mEk+/QPx/ep7vkEER5l7D3ojccSdegKLL0Y1PLmkGEh+SKSW
	 eZ6EyfiETlfxjXd9jCTSctv9MA7iEt+ZAEDbgXUJOlJpgw6tlIq1yOkPzNhkjn6WYq
	 Lf9bdqfaZC1BMFGHK8mSqDlCQjNjhrx0Q3esw0m5MwOL0qEV2ct19dDWWrKhOAwQME
	 Yben8WHlpvRJDgKNJgIcJS3O10DB1l6oiNfYrqn4CG65NJ9z1aHVvRh1/+PSjsXfAo
	 FvdITlsbd7JOA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5159f9de7fbso47439e87.1
        for <regressions@lists.linux.dev>; Fri, 22 Mar 2024 10:23:26 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw1XpANxtXkmko1x9scFClMVPybHeFwgwlXxe9bkxpENMGaZ3Q8
	kXCI4U6z4VZNY+QUqqbI/qr6nqF/KTCXUtVJZhxJ/h0rOhRz7tOOmTdhAU0qZHpzAyUrvHJ0KZL
	EoD0tl17/mnbFoNOnvkLOUqc5p4E=
X-Google-Smtp-Source: AGHT+IHGz1U7i4FzKjrEYtXmsu7Uch5qMRfpR7h8aDiBN+2F7o3PyZNP57SQVSp3TkmfvX0IE1cnYy7b3HqbTV98OVc=
X-Received: by 2002:a19:e01a:0:b0:515:85c7:7e12 with SMTP id
 x26-20020a19e01a000000b0051585c77e12mr94490lfg.0.1711128204760; Fri, 22 Mar
 2024 10:23:24 -0700 (PDT)
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
 <dd6e61ac-2356-4b97-85b4-b963a045361b@podgorny.cz>
In-Reply-To: <dd6e61ac-2356-4b97-85b4-b963a045361b@podgorny.cz>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 22 Mar 2024 19:23:13 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGcsEhf24QO1_4Wf99z=PR1cqdxim0Ttj-TqQijZOW=+Q@mail.gmail.com>
Message-ID: <CAMj1kXGcsEhf24QO1_4Wf99z=PR1cqdxim0Ttj-TqQijZOW=+Q@mail.gmail.com>
Subject: Re: [REGRESSION] linux 6.6.18 and later fails to boot with "initramfs
 unpacking failed: invalid magic at start of compressed archive"
To: Radek Podgorny <radek@podgorny.cz>
Cc: regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: multipart/mixed; boundary="000000000000cf7b2506144314d7"

--000000000000cf7b2506144314d7
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Mar 2024 at 18:29, Radek Podgorny <radek@podgorny.cz> wrote:
>
> hi ard!
>
> sorry for the delay, i had some stuff to handle. :-(
>
> anyway, i've set up somewhat more organized testing environment so i can
> now test possible patches much more efficiently (but still not instantly
> - the compilation still takes some time on my machine).
>
> i'm sending results of previous patches. explanation:
>
> 99 - unpatched linux-mainline (6.8) - does NOT WORK
> 100 - applied patch 100 (revert) - WORKS
> 101 - skipped - patch does not apply cleanly
> 102 - applied patch 102 - does NOT WORK
> ...etc. up to 105 - neither of which works :-(
>
> screenshots of stuck boot attached (and in one case - patch100 - unstuck
> boot).
>
> by "stuck boot" i mean a situation when the pc boots up, the bootloader
> loads the kernel (and initramfs?) and tries to continue with the boot
> sequence but gets stuck forever without any signs of further activity.
> ctrl+alt+del does not work - i have to reboot with physical button. see
> the attached pictures to see what i mean (and try to spot the difference
> between non-stuck boot in picture 100 at the very bottom).
>
> eagerly waiting for more - possibly lots - of patches to try!
>

Please try the attached patches - they are partial reverts of the
offending patch, and knowing which one of those breaks your system
would be useful to narrow this down further.

--000000000000cf7b2506144314d7
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Partial-revert-of-8117961d98f-2.patch"
Content-Disposition: attachment; 
	filename="0001-Partial-revert-of-8117961d98f-2.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lu2xjjx80>
X-Attachment-Id: f_lu2xjjx80

RnJvbSAyMDk1YjE5NzlhYmJjMjJlYTgzY2EzZGIxNzFlYjNmNzhiY2U5OTY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPgpEYXRl
OiBGcmksIDIyIE1hciAyMDI0IDE4OjIxOjI5ICswMTAwClN1YmplY3Q6IFtQQVRDSF0gUGFydGlh
bCByZXZlcnQgb2YgODExNzk2MWQ5OGYgIzIKCi0tLQogZHJpdmVycy9maXJtd2FyZS9lZmkvbGli
c3R1Yi94ODYtc3R1Yi5jIHwgMjMgKysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAyMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9m
aXJtd2FyZS9lZmkvbGlic3R1Yi94ODYtc3R1Yi5jIGIvZHJpdmVycy9maXJtd2FyZS9lZmkvbGli
c3R1Yi94ODYtc3R1Yi5jCmluZGV4IDk5NDI5YmM0YjBjNy4uZDM2NzhjYTIzOTgwIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL3g4Ni1zdHViLmMKKysrIGIvZHJpdmVy
cy9maXJtd2FyZS9lZmkvbGlic3R1Yi94ODYtc3R1Yi5jCkBAIC00NjAsNiArNDYwLDcgQEAgZWZp
X3N0YXR1c190IF9fZWZpYXBpIGVmaV9wZV9lbnRyeShlZmlfaGFuZGxlX3QgaGFuZGxlLAogewog
CXN0YXRpYyBzdHJ1Y3QgYm9vdF9wYXJhbXMgYm9vdF9wYXJhbXMgX19wYWdlX2FsaWduZWRfYnNz
OwogCXN0cnVjdCBzZXR1cF9oZWFkZXIgKmhkciA9ICZib290X3BhcmFtcy5oZHI7CisJdm9pZCAq
aW1hZ2VfYmFzZTsKIAllZmlfZ3VpZF90IHByb3RvID0gTE9BREVEX0lNQUdFX1BST1RPQ09MX0dV
SUQ7CiAJaW50IG9wdGlvbnNfc2l6ZSA9IDA7CiAJZWZpX3N0YXR1c190IHN0YXR1czsKQEAgLTQ3
Nyw5ICs0NzgsMTkgQEAgZWZpX3N0YXR1c190IF9fZWZpYXBpIGVmaV9wZV9lbnRyeShlZmlfaGFu
ZGxlX3QgaGFuZGxlLAogCQllZmlfZXhpdChoYW5kbGUsIHN0YXR1cyk7CiAJfQogCi0JLyogQXNz
aWduIHRoZSBzZXR1cF9oZWFkZXIgZmllbGRzIHRoYXQgdGhlIGtlcm5lbCBhY3R1YWxseSBjYXJl
cyBhYm91dCAqLworCWltYWdlX2Jhc2UgPSBlZmlfdGFibGVfYXR0cihpbWFnZSwgaW1hZ2VfYmFz
ZSk7CisKKwkvKiBDb3B5IHRoZSBzZXR1cCBoZWFkZXIgZnJvbSB0aGUgc2Vjb25kIHNlY3RvciB0
byBib290X3BhcmFtcyAqLworCW1lbWNweSgmaGRyLT5qdW1wLCBpbWFnZV9iYXNlICsgNTEyLAor
CSAgICAgICBzaXplb2Yoc3RydWN0IHNldHVwX2hlYWRlcikgLSBvZmZzZXRvZihzdHJ1Y3Qgc2V0
dXBfaGVhZGVyLCBqdW1wKSk7CisKKwkvKgorCSAqIEZpbGwgb3V0IHNvbWUgb2YgdGhlIGhlYWRl
ciBmaWVsZHMgb3Vyc2VsdmVzIGJlY2F1c2UgdGhlCisJICogRUZJIGZpcm13YXJlIGxvYWRlciBk
b2Vzbid0IGxvYWQgdGhlIGZpcnN0IHNlY3Rvci4KKwkgKi8KIAloZHItPnJvb3RfZmxhZ3MJPSAx
OwogCWhkci0+dmlkX21vZGUJPSAweGZmZmY7CisJaGRyLT5ib290X2ZsYWcJPSAweEFBNTU7CiAK
IAloZHItPnR5cGVfb2ZfbG9hZGVyID0gMHgyMTsKIApAQCAtNDkxLDYgKzUwMiwxNiBAQCBlZmlf
c3RhdHVzX3QgX19lZmlhcGkgZWZpX3BlX2VudHJ5KGVmaV9oYW5kbGVfdCBoYW5kbGUsCiAJZWZp
X3NldF91NjRfc3BsaXQoKHVuc2lnbmVkIGxvbmcpY21kbGluZV9wdHIsICZoZHItPmNtZF9saW5l
X3B0ciwKIAkJCSAgJmJvb3RfcGFyYW1zLmV4dF9jbWRfbGluZV9wdHIpOwogCisJaGRyLT5yYW1k
aXNrX2ltYWdlID0gMDsKKwloZHItPnJhbWRpc2tfc2l6ZSA9IDA7CisKKwkvKgorCSAqIERpc3Jl
Z2FyZCBhbnkgc2V0dXAgZGF0YSB0aGF0IHdhcyBwcm92aWRlZCBieSB0aGUgYm9vdGxvYWRlcjoK
KwkgKiBzZXR1cF9kYXRhIGNvdWxkIGJlIHBvaW50aW5nIGFueXdoZXJlLCBhbmQgd2UgaGF2ZSBu
byB3YXkgb2YKKwkgKiBhdXRoZW50aWNhdGluZyBvciB2YWxpZGF0aW5nIHRoZSBwYXlsb2FkLgor
CSAqLworCWhkci0+c2V0dXBfZGF0YSA9IDA7CisKIAllZmlfc3R1Yl9lbnRyeShoYW5kbGUsIHN5
c190YWJsZV9hcmcsICZib290X3BhcmFtcyk7CiAJLyogbm90IHJlYWNoZWQgKi8KIAotLSAKMi40
NC4wLjM5Ni5nNmU3OTBkYmUzNi1nb29nCgo=
--000000000000cf7b2506144314d7
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Partial-revert-of-8117961d98f-1.patch"
Content-Disposition: attachment; 
	filename="0001-Partial-revert-of-8117961d98f-1.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lu2xjjxj1>
X-Attachment-Id: f_lu2xjjxj1

RnJvbSA5ZDNkZjJmM2Q3ODFhNzcwZTkzZWZkNWFiZjhjYjg3MmIxNTAxY2Y0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPgpEYXRl
OiBGcmksIDIyIE1hciAyMDI0IDE4OjExOjMyICswMTAwClN1YmplY3Q6IFtQQVRDSF0gUGFydGlh
bCByZXZlcnQgb2YgODExNzk2MWQ5OGYgIzEKCi0tLQogZHJpdmVycy9maXJtd2FyZS9lZmkvbGli
c3R1Yi94ODYtc3R1Yi5jIHwgMjUgKysrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxOSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
ZmlybXdhcmUvZWZpL2xpYnN0dWIveDg2LXN0dWIuYyBiL2RyaXZlcnMvZmlybXdhcmUvZWZpL2xp
YnN0dWIveDg2LXN0dWIuYwppbmRleCA5OTQyOWJjNGIwYzcuLmIxMTdmZTliZTUxNiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi94ODYtc3R1Yi5jCisrKyBiL2RyaXZl
cnMvZmlybXdhcmUvZWZpL2xpYnN0dWIveDg2LXN0dWIuYwpAQCAtNDU4LDggKzQ1OCw4IEBAIHZv
aWQgX19ub3JldHVybiBlZmlfc3R1Yl9lbnRyeShlZmlfaGFuZGxlX3QgaGFuZGxlLAogZWZpX3N0
YXR1c190IF9fZWZpYXBpIGVmaV9wZV9lbnRyeShlZmlfaGFuZGxlX3QgaGFuZGxlLAogCQkJCSAg
IGVmaV9zeXN0ZW1fdGFibGVfdCAqc3lzX3RhYmxlX2FyZykKIHsKLQlzdGF0aWMgc3RydWN0IGJv
b3RfcGFyYW1zIGJvb3RfcGFyYW1zIF9fcGFnZV9hbGlnbmVkX2JzczsKLQlzdHJ1Y3Qgc2V0dXBf
aGVhZGVyICpoZHIgPSAmYm9vdF9wYXJhbXMuaGRyOworCXN0cnVjdCBib290X3BhcmFtcyAqYm9v
dF9wYXJhbXM7CisJc3RydWN0IHNldHVwX2hlYWRlciAqaGRyOwogCWVmaV9ndWlkX3QgcHJvdG8g
PSBMT0FERURfSU1BR0VfUFJPVE9DT0xfR1VJRDsKIAlpbnQgb3B0aW9uc19zaXplID0gMDsKIAll
Zmlfc3RhdHVzX3Qgc3RhdHVzOwpAQCAtNDc3LDcgKzQ3NywxNyBAQCBlZmlfc3RhdHVzX3QgX19l
ZmlhcGkgZWZpX3BlX2VudHJ5KGVmaV9oYW5kbGVfdCBoYW5kbGUsCiAJCWVmaV9leGl0KGhhbmRs
ZSwgc3RhdHVzKTsKIAl9CiAKLQkvKiBBc3NpZ24gdGhlIHNldHVwX2hlYWRlciBmaWVsZHMgdGhh
dCB0aGUga2VybmVsIGFjdHVhbGx5IGNhcmVzIGFib3V0ICovCisJc3RhdHVzID0gZWZpX2FsbG9j
YXRlX3BhZ2VzKHNpemVvZihzdHJ1Y3QgYm9vdF9wYXJhbXMpLAorCQkJCSAgICAodW5zaWduZWQg
bG9uZyAqKSZib290X3BhcmFtcywgVUxPTkdfTUFYKTsKKwlpZiAoc3RhdHVzICE9IEVGSV9TVUND
RVNTKSB7CisJCWVmaV9lcnIoIkZhaWxlZCB0byBhbGxvY2F0ZSBsb3dtZW0gZm9yIGJvb3QgcGFy
YW1zXG4iKTsKKwkJZWZpX2V4aXQoaGFuZGxlLCBzdGF0dXMpOworCX0KKworCW1lbXNldChib290
X3BhcmFtcywgMHgwLCBzaXplb2Yoc3RydWN0IGJvb3RfcGFyYW1zKSk7CisKKwloZHIgPSAmYm9v
dF9wYXJhbXMtPmhkcjsKKwogCWhkci0+cm9vdF9mbGFncwk9IDE7CiAJaGRyLT52aWRfbW9kZQk9
IDB4ZmZmZjsKIApAQCAtNDg4LDEzICs0OTgsMTYgQEAgZWZpX3N0YXR1c190IF9fZWZpYXBpIGVm
aV9wZV9lbnRyeShlZmlfaGFuZGxlX3QgaGFuZGxlLAogCWlmICghY21kbGluZV9wdHIpCiAJCWdv
dG8gZmFpbDsKIAotCWVmaV9zZXRfdTY0X3NwbGl0KCh1bnNpZ25lZCBsb25nKWNtZGxpbmVfcHRy
LCAmaGRyLT5jbWRfbGluZV9wdHIsCi0JCQkgICZib290X3BhcmFtcy5leHRfY21kX2xpbmVfcHRy
KTsKKwllZmlfc2V0X3U2NF9zcGxpdCgodW5zaWduZWQgbG9uZyljbWRsaW5lX3B0ciwKKwkJCSAg
Jmhkci0+Y21kX2xpbmVfcHRyLCAmYm9vdF9wYXJhbXMtPmV4dF9jbWRfbGluZV9wdHIpOworCiAK
LQllZmlfc3R1Yl9lbnRyeShoYW5kbGUsIHN5c190YWJsZV9hcmcsICZib290X3BhcmFtcyk7CisJ
ZWZpX3N0dWJfZW50cnkoaGFuZGxlLCBzeXNfdGFibGVfYXJnLCBib290X3BhcmFtcyk7CiAJLyog
bm90IHJlYWNoZWQgKi8KIAogZmFpbDoKKwllZmlfZnJlZShzaXplb2Yoc3RydWN0IGJvb3RfcGFy
YW1zKSwgKHVuc2lnbmVkIGxvbmcpYm9vdF9wYXJhbXMpOworCiAJZWZpX2V4aXQoaGFuZGxlLCBz
dGF0dXMpOwogfQogCi0tIAoyLjQ0LjAuMzk2Lmc2ZTc5MGRiZTM2LWdvb2cKCg==
--000000000000cf7b2506144314d7--
