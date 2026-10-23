Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792777089;
	b=KVKISgx2IPasjpeMx16hfcGvKRK2axKjjCDFFKZP1sp5UU2aWbuWipjDbcva2k8ovVU0
	 PbUgyzF2WsB01F+A/PpdPDqKTPoL/zIfp/N4fbBcHJ5Ac4ZgAQABvaaAf5WEqEgxrCM9o
	 kYEJyXzlM6qZUGq4dgLSVmaycH34KETfnkdzhlnrNjl3M5RPMZMs/WYhxT8vlfUrlsSfL
	 a/D2gpJWihJ8D6nPzRDlrZMrJ3teZ1L+XyigR0VZonkpChnAfOce2gapmmQV/jvx6CeAA
	 kSwwUHKW9WwkTZDXKhzwtSF1Ha981sdBlLWEF7aiCKlk4AruKD5QVsoiqVYMMpskJNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7SleIgzgD0Ym0qkpIeLydzQGzolB+0IIJ55uqtkTIdM=;
	b=J7KX0GHVj5NOwa0jc+UsELez2LqTkhb0RC5Gw7jCGp5M81xp/7/qgYIb2GVHLACwNRDt
	 HTeCfHdsnDaIV36wzOiU78Ifx42Rel/o5YUxDcAPYlGFD9PThbuwTFGMjm9Yzjpj0iL6S
	 ZO3i3VzPgOgvqlkNAA2yAEBjuEL+mtYZl8K95hVXF/LjFpTxGEwyATHMAkgS55Ii9XLcC
	 dcVWbupfaS1J8KBLtapcoKHtzxjx02wXrSdfpk0A0zKXBC4Mh4Q8NEVQgEEDJide1D3/M
	 rHY9jtWFH5RjaCQ6mZCI/eyRArQWc1onsJXeaYKYu96NGjJBR01gENTdC6PwbV48zrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DX9iGDK+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646EB606A324
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 17:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 646EB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DX9iGDK+
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so7252941fa.1
        for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 10:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792777087; cv=none;
        d=google.com; s=arc-20260327;
        b=HosF7XGY5iEcgNwOvembfoWyqkWHHHxRZClaVURHy5MtP5SirLWySMVnaU5FNqqG9S
         vtQXI+l/JNFx0Lt7jpMbfz2f2DE6q5q2B07665Ee7AT+cGEIM2017isRO5vrFXJRNxO9
         pDJRdNh9wQ1KXTj0tHl1Uf28MM4PXR9sVk5E5p5H6fCuWFQhxFbxECpsbpPQni5jdK04
         2fnBfv2sT/Gr+idmUIu1bD0U0vCwV4mNjy7oNi//uRsWrj7jmEIYkwILgADGG2t0tBGj
         mBJq+rn7aPIyVNOcUMJzTU28UaZ0FFOh9l7eHz3wBMNVa1fVKUnH4ls8rnv6djIje8oh
         M2uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7SleIgzgD0Ym0qkpIeLydzQGzolB+0IIJ55uqtkTIdM=;
        fh=FFA/RHgj0bIYsDR4waMaBakRX/LjxNB9HxJ/NgvvG4U=;
        b=DX048ewkhPdWzaZTgI33njB1SrNhOmzNEtN0lVgdNaA3Gr/jy4OadSmD9yOayO7Lca
         mK/lNdyGfICJwtyWMG0QV2JlAKXufviVYWPLMBPDSzCQR5wecbUpcdSbubz2J2r1LSoG
         2y7Mew4DqcOUFd/lZWBCvGyXkXXBdOzEyH9P6K/BApjwXAMtZTTHnX1uzGJOev7oPZKL
         qaocOfPACXwH7ulcP7tRhFBmBCnIHex+F9UEsildpwgF4owvqAxGoCDX0NT7Yn0hjEDP
         9yecHMjJrHsNDxPscsnr+SD6mzIMbiaFyFb/rRhZp8JwKopKV/73iElclcp4hMLV/FW4
         ziHA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792777087; x=1793381887; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7SleIgzgD0Ym0qkpIeLydzQGzolB+0IIJ55uqtkTIdM=;
        b=DX9iGDK+rrPfGNW4yNNPRDYRWH2IzrHMqr0HUQL/wrKAHE2zYx5jiwNBn7pLoKvezu
         dNaE1ZN9i1ooTZJRPOjuRpvINgpVKcwCq51ts16MZH/BFM5+tNG7kUxHlnqHc0aMnLAI
         0p8K1EHpw+SxtYjuONlnUywD/Cos7vF1im4xx7YhlM7c1oGUfNOhp7dRWHuU+lIQqiGE
         aPnNb9jprQTCJJciD/t0CZPp2nvs4BnlswyCNVohk98Ijtb1EoVKbY0KdQbCp6dRarUk
         qLmP94ShPSiSQYFHk0HXsG3u/BBnW2A8srIhsrmnn5xsHb07UjPG8a6aBRrLyOy/+A/E
         nOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777087; x=1793381887;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7SleIgzgD0Ym0qkpIeLydzQGzolB+0IIJ55uqtkTIdM=;
        b=CN/FRITyMBw2EcqgJbE6FpW9RklneBI0t1yrne8DcWuCOHQQSjSdqU64kstrONqvYt
         Sk49eommwLzE+5P2cr4JwxjBPQuqrkduxbkmrx/1rBQ0x1wyreBDjRmybtdOeSsL5FXt
         lv7TD/TMCag9mj8fYiAhi0OyfFstVbs+tbSyXc12tv+9aBRewq4lzoR6NLsWaSd62AyR
         yNJuLHFBPgGIzoVlL6uqkuofY96Imrw0cwmLyaQ76ZbZf6SPYVW2Vpjlm2BFCe3jabF0
         Hjp9Us+sWySS0C9YBvJCJiEHVmYb5fpEBvHFbj/xFkxz0URRww+mfgAnmL/VZAvyIrdA
         rELw==
X-Forwarded-Encrypted: i=1; AKwUvByaULnnIBCfczO/AsPiYEexlbNdFySfLX77TFM2YchUgL8By7RV8uOZhwnKATeQYKXr0VnJjQBeb1aOmA==@lists.linux.dev
X-Gm-Message-State: AFq9FYK//4vs8P8ZXLkgTI4Kz6/W0pRMa31GuCCwOwqseILrVq41FRFL
	geEjWnu6sn9dKA9Etp1KTGgMu7qP6x+ezFXhwucJgQYjOOdSab+wfl0Eaag5S1qA2oW22sEnksI
	T2ifptBYMSL9PSLSAtDughTQHGpf7Ufc=
X-Gm-Gg: AYBFou0zyRlWfVqXiBLsSbex9rJavcfjoSAhJuQD0vHf4bzkugNryRLLrHKW7JJKjzT
	dkBEGcBV3WFwLRBuXtk5GWaeDFhhEG6I3tTFC97oN8f50u/j9TfWGFzLAf0C7nkwX6Rqj6piYhm
	pTrBWPTx3nEQli6JtchmQO61WSd9tvz/eoXK/OVX7Nelkj/thOpz07aLL/aL7DkZMmeYo2yy6R1
	9XLeoge2lprsCUu0rjWy4faM0OPpWIO4Y7P+4gAxDW5elrm/eZRCGwlVdu/1aeBQLjZdPF9NKkv
	aQP9vKtU5bfHvBxVAaBynPtxYWYow1bWhI9U4iXQEe+K+RbnF+YVzYv0/2eiE8ASAN3SwLsgYuM
	EAQbHKXwLjUX6k+YoRr4zzzKkGq67eR1b8cFdE5PlpALG9PiDHvYsdnduxwGMUmNYdz7e8JeJ6E
	dduMPJUJkU9UUiSu6Z
X-Received: by 2002:a2e:a917:0:b0:3ab:1fc4:8eaf with SMTP id
 38308e7fff4ca-3ac6fcc01bbmr148131fa.5.1792777087213; Fri, 23 Oct 2026
 10:38:07 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAAzpgGdksHZjx4jc20zqnAG_PQ2e1ggANQjt2eiycUiWc+vPHg@mail.gmail.com>
 <f32dfa8b-fc3e-4d8e-a010-20e822ed0c08@leemhuis.info>
In-Reply-To: <f32dfa8b-fc3e-4d8e-a010-20e822ed0c08@leemhuis.info>
From: =?UTF-8?B?TG/Dr2MgS0FTU0VM?= <loic.kassel@gmail.com>
Date: Fri, 23 Oct 2026 19:37:54 +0200
X-Gm-Features: AclHuK-M0RYmqjNYweqYpPwUynzkfhJb8RPOvxN8VMGCO80UPqv0N76SUV1cgDY
Message-ID: <CAAzpgGdbKP8YmPT7Z9tzw_Sy4BJ2VP4c4=dOf93i8rZQS1zfgQ@mail.gmail.com>
Subject: Re: [REGRESSION] mac80211_hwsim: beacons stop after host suspend
 (beacon_timer is CLOCK_MONOTONIC, expiry computed in boottime)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Johannes Berg <johannes@sipsolutions.net>, Benjamin Berg <benjamin.berg@intel.com>, 
	linux-wireless@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On 23.10.26, Thorsten Leemhuis wrote:
> - Test if a current mainline snapshot as of now is improved (the wifi
> changes were merged just a few hours ago) or wait till 7.4-rc1 and test
> that -- maybe it fixes things.

Thanks for looking at this. Benjamin confirmed the analysis for this
report, and I have now sent a fix:
https://lore.kernel.org/linux-wireless/20261023-hwsim-beacon-clock-v1-1-9b3=
f3ffc099b@gmail.com/

I'll follow up on the other report in its own thread.

Ciao,
Lo=C3=AFc Kassel
