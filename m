Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792A42D7380
	for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 22:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786487433; cv=pass; b=c1DYRP0aiqL3DwZTiDa4bi9qZiDSNL8c0GMUUFnonbIM87akvhqVlj+oVa+OoXAtMuoAtT/Xzpsl2NL4FTcUQpfcR4jr5tDVqgMPAir3JES8z3M2wqddpkOpK4U2gHR99gMSC5uugZmlrOJNqZSYnNVPVI2Xmp9upl1DNfW8Hgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786487433; c=relaxed/simple;
	bh=WjeF5H9DpNVCYc/EMdaqQaRCP697dc9B5k9hEFOpSuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLCJwn1mT/NUUD8dKYvuhBjl1QBO5cvAnTNzFmIKSxdccxvXo8SzAWTO9DZVlc0zmNu+YOJAiYYPfVXWwo0Sz9CbRQ9mr97oUTi+xAKIf5UONwT1cJVebJayU5oH+9Jxfllc/PSPT8Mxl823LtrMMSkibP1wi8os1eawPhJ5ZP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsEUQWWY; arc=pass smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsEUQWWY"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7ebd88be784so304785a34.2
        for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 15:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786487430; cv=none;
        d=google.com; s=arc-20260327;
        b=RoM9g+w8P3AwVVDHX4+ENhNwCluJHerN6Z1E9mTf1aI0oMIPfp6oK25dLtmMwFt68Y
         cz0Shj2AApsOLFYTF9kZT6cyFm9H2aMiTvIEn7etuKbcOlw8UBAjhsi93R2L5sYDSoLA
         vSbR1ek8dzN8S3ZNJtaCIY1BAaz56cQTdDP0qOM9MbTlgzbFn4ojUUEZUwoRi0aPBzSl
         S8pjOBB0qBI56uu1vVL9QtdRN36J3G/B2wMTbNUejbNEvAZ3hrQr/zRysJa6F/YpMVE0
         k9ImHclSQjGq3JxYifUOXD7hugFVJl8tbnVxG4HvSXTqIAftP508wXp1PC2Uvhz9mNSO
         hKNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GAluQTC1HpvjZU0entrIRv7rLBpoBCi0VS32rmx7Aj8=;
        fh=qq4d1pQ7FcFcSrMnfJOojW1LzAu2Gjqp8eBjYT+jGP8=;
        b=Ik8f329b2KraoNhnFuwA92w8OzZ75XwGDKVmakjsqnYlna2W5oIMY4dIURVAUVqPk9
         Kj4aw2kJhAQYUaKIko2/+r+/fjMTkswBo6L5W1Tz6oxajt13lF/urRDGFKN1tkmo88Da
         Rov+zwssIrdfVM/VCN4lTYzLdiW2wRLO2r5EajR4j2goyRBBcJtsAoMeV2gFZnAin/1U
         MLjeJQA3ztbWuEi3mUsvVVpfFy0f8nYjUByJeBro8C3SmVP00CfUVPF2kX9LvK9mpOuo
         CUsRu6hjTKwguypPwQbWSXB94dG4Kv6sdZnoY0sCXriU3plNNAZDJY7I5hbhJ2/1pebc
         H/nA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786487430; x=1787092230; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GAluQTC1HpvjZU0entrIRv7rLBpoBCi0VS32rmx7Aj8=;
        b=IsEUQWWY0ZNysidrJ9yJ2nX6ystMt3ut6BtIWNdH+gvfHqrhdiG1VwTKEuft9o8xeS
         bVo9Td9q316t8muH7leGVDx56yoaDNrJHJUzNqu1nmG6sY5i+kRMaSEnuXjtoGxwO1eI
         TJ2OmODyerxKyR/V6rKnnAI8OFFWGx1BAIbgQnwRwE7boRo9Qdg6CpQ6phpKFYHiao0v
         gS5rDex4C1iTCTzpoYO4+/xdmpEK6GJPqOZTycdDw1TBIItwWbrr6soe/z5mFpI3I+0C
         pk4JpvIbhBr3m0MEmvdAdluPltTKrGPpnj3l2Qkcx0mLeFIa0GzHCBxJls12k1qYciAW
         eP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786487430; x=1787092230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAluQTC1HpvjZU0entrIRv7rLBpoBCi0VS32rmx7Aj8=;
        b=dEDBVR88bXl0BRKJDuUmX7qqJhiE/vXEPX0LzloW9VRwAItu8Thwmh6yGFT4kAZPnG
         UsV9djpU3F2vtGbXkMUdNnHGqKx9NVelLCY8gJK1Cir2wtkSi8OKNw/PoioVq/NuRU/G
         3salfHMCnsfCgqzOo1ayVeAdmQaTtQqF0hG1pVMzfowNozzoOcUShtiXcp5DU82oXO/u
         yDXiRykOsbhrqfXE8MY7S4Dckc1PeFWTx5+j5u6CS1vE4pVc69gXN/u/5Tl8Z+nNoY1n
         EDwcMXzwj1RtPBQoi30f1ogzjHjHvzbL82J0Q3tSq6xajscz2FfItGJ+GUd6cVg5ydif
         ikDg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2hCq2A16f9YxTlOnYQ1FBBjiM5M2cph1UFUl88dScJCK3zZaJTuJnPYvtbcGIRWqEssKb6IuQ+6XByA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2UvFLaFgFz8G1Ldo1ImkiJBXTrKyWHkT0vm4XpIkdmvRsxDTG
	FcMzdn6a/iAYGIlJbkpk0jQMms0UWeqdh7sjB800oKD3M82yro+GDlRMBmpNQCgHfPQxaVAV6MN
	OzgllJhU1Igu1QKrZWMuDD73T2fq7k74=
X-Gm-Gg: AR+sD13N6dYZaY8R7LtBuRBoaipGcNCeWS/Gcvr4F7vMJXGbIILKOYXCi92t8EC+gqh
	9ySpYet309uSzPWPaJPE6ji/3UnfOutMe/A1DZD8C/stXV9BHxm9axOfcmlVNVE8lYPOkPGba7N
	n5EEOpIPY8EAo8xOjHWE96DmrhMLMSYl4CFm1iWgokkr8nHFawZF2zp9WcjI2XhQifRFuPWb8JN
	mVsUf+eHN173KxDnLskbIgPGkkEE8h7a5HWMDEPpFDSvZGayvzLM0tJgtERciT6UFhA9eCu0xvF
	0ggp2d/VTECHCHSsBp4xB8pQ7sd2bzx3kJRDCcQVGVoKB/pSRWg7vD+UzC+LmLxJKMrdyUOscNP
	j42BGsXuWICuwqpNupRW6wGhI6Pzn2jo=
X-Received: by 2002:a05:6830:710c:b0:7e9:bd00:c6ad with SMTP id
 46e09a7af769-7f3b7a23167mr511244a34.16.1786487430342; Tue, 11 Aug 2026
 15:30:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804120004.523934-1-mikhail.v.gavrilov@gmail.com> <18b018d0-7f7d-4975-b0b3-5e3c9f413698@leemhuis.info>
In-Reply-To: <18b018d0-7f7d-4975-b0b3-5e3c9f413698@leemhuis.info>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 12 Aug 2026 03:30:19 +0500
X-Gm-Features: AUfX_mxvZd9umIL-RShv2edCLQha08PkNNHjtYVDzPOfUnTe4RAPFxDGdW_lE6g
Message-ID: <CABXGCsMhfR-fOwUgKuQrojM8jEpdco_m9aYA9ph_EOrCfaPxeA@mail.gmail.com>
Subject: Re: [PATCH wireless] Revert "wifi: mt76: Disable napi when removing device"
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>, 
	Bert Karwatzki <spasswolf@web.de>, Devin Wittmayer <lucid_duck@justthetip.ca>, 
	Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 2:11=E2=80=AFPM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> What's the status of this? Looks like things stalled.
>

Nothing is blocked on my side - the patch is unchanged and ready to be
applied as posted.  Since it went out it has collected:

  Acked-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
  Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca>

and Nicolas supplied the tag wifibot asked for, which I agree with:

  Fixes: 13b7e6a96a00 ("wifi: mt76: Disable napi when removing device")

I have not resent it, since the diff is byte for byte the same and those
trailers are in this thread for b4 to pick up.  Happy to send a v2 with
them folded in if that is easier for whoever applies it.

Nicolas has also posted the proper fix for the mt7915e WARNs that this
revert reintroduces, which depends on the revert going in first:

  https://patchwork.kernel.org/project/linux-wireless/patch/20260810154923.=
32546-1-nicolas.cavallari@green-communications.fr/

So the pair is complete.  Both are still sitting at "new" in patchwork:

  revert: https://patchwork.kernel.org/project/linux-wireless/patch/2026080=
4120004.523934-1-mikhail.v.gavrilov@gmail.com/
  mt7915: https://patchwork.kernel.org/project/linux-wireless/patch/2026081=
0154923.32546-1-nicolas.cavallari@green-communications.fr/

Felix, could you also mark my withdrawn first attempt as superseded?  It
is still at "new" too, and it must not be applied - it replaces the hang
with a use-after-free:

  https://patchwork.kernel.org/project/linux-wireless/patch/20260728002048.=
19351-1-mikhail.v.gavrilov@gmail.com/

--=20
Thanks,
Mikhail Gavrilov.
