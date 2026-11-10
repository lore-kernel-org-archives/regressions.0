Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311478;
	b=fAkQUEYWflkwYB55dnQClsGBqcEcgrXAe1Dj7yEkj7Upwj3BjuMI/QlKaNkXDMJqr3Ji
	 sD8rzpnRZS3nCwS5UaFUeXQDNZkT/Cn5QdRjQxc66utYmBTAQsU+YD6XfNbpuRcBCM10S
	 Sb1mA/Gppah+kB8yxB9cAGf9S5ym5PEwZp+P3c7ZnWk3hH/lSx+mN8+phUH7TBE9S1PzE
	 KxgV395DqpNybkuQfEikgxqoqlCpPXvY70leBE4u3i+RYUigtf1W+soRQyPfNoiLGB+QI
	 XK5s8MhzKxM7QuhJve9J10iuSODFiFAajcYsp+Iw6naUe9EGiXhBnn/EbgrP31eSvng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CMqiiywlLSX/magk1AgnOQL9lgKVlf5mAM1veg6/n8A=;
	b=Zlr6ST+bUpHu99pmezvpJxaB7guK0g9h3YJ8hU3a5UgP8upkPd7dWZ/8Qm7mD7dRBoiB
	 hJE+U3H3aP3v+/RbKkk4/E2UnbykJBW8Xk1S7cd/8NMvVfV6Bg6OIlr8j5lsYz67VuP4a
	 AxE6PpFfNKEWuaYswKq0mTujVgBGznQYiC9yFOtKksmyyQWXzc/rGds3FWHzPGkSmYAUw
	 0L91s6wUbGlYBNS3bWX3BxUTISvcifs3mrWJC1gKeTQHrq3GE/nK3Za7oBV/JaBkTb48y
	 SiIwiAo9Z6YSoiWTVNiBToPj65dmUK0LTNWbEyB2fDpZ4rOiKBgL2QmV4Dg77NdcD1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r8oVmyin;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3278160A260D
	for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 11:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3278160A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r8oVmyin
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so16966875e9.1
        for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 03:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794311476; x=1794916276; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMqiiywlLSX/magk1AgnOQL9lgKVlf5mAM1veg6/n8A=;
        b=r8oVmyinIud3QrTu5shhq6jTxQhvX2N6/66VS0m5Ds1WZQyGdinY66wreFdSlH7rQS
         AwGlRmhBFsGlnnKEdRTieaWfqhKyScDbSwMFPA94cmrdumxRNfYrgR9/ZLR4Jqt9RBk3
         XA9jnsKcYZBAOaBzTK0nv4+0uJ5fV6w6zW6UP4NSF22SDnDmQ3Oa+bRtWH9Yf0LCaBAE
         rSVb1e7o51cuwVhKmmbKEVAg2JDzEV3jMkD7yWfV35mRqN0ET7zpGK2B9padI43cUwzO
         nL8KSMt6DROPx9r24fi0Y6nVIZmgmw/CWUajZi3fksG0sXBpYL7c1QqB6ToMmVfyIgFR
         J89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311476; x=1794916276;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMqiiywlLSX/magk1AgnOQL9lgKVlf5mAM1veg6/n8A=;
        b=H5XiqE55W9TouiXexR3k0VOEbLKermOcnWGVKOGnnkq0GepdM/8toIVRy6QgWsABLn
         jS+9+j9s5hPH4A40Fc0lAAqfpfuAeOvgmvNIG4DFeVMXJhDOJB7kFrpI81bPfmgTJoZ0
         VHQgaWFJoncbLWkYLobojip4q915JWGwRKk0hYejAa2wNBir/5HqI4EF1hxQjWPFpcp3
         hGyNTefh2N8gUH7seiGBiOmo6JP38BkVSWhXrjD0yEwHEfXppOG3hZve+0Ievklo3Q0q
         59rzKPuHfd+IaeFPXFf8rK5dax7/TPaCSEpnq4AbZ3s54tfjlhSUFBLklkcGiHo37oHk
         sluQ==
X-Forwarded-Encrypted: i=1; AL+hErEZLR9Xgw5WdukxkZSqB7o6DaA03rBmfd4pULwPjGaVAgvZWou13XuX9TTfS6DJl6m+16rQmNF7NqP4mw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+83VEnPNmzCpdOJzq4EGDYAlSG8qrw3CYDT9TSXKhvKLQDdczo
	Lc95W2U9n69ysIsR9aFR3fk4cZwG7la0QbAZdx9gDUqOXYYgWGA67ejH
X-Gm-Gg: AYBFou0cnGyhYyFwVTsyypSAxaSn/uAYzKgZe4ZcDhrrdA9GG4WrCt0JUhj2Ee0kxR6
	NOUXFx6j19udZQc2RMIhdv/Gh4jRzHRnMUFOLggDkUDLXWKkEX0p+07VaFymJ15+VqCeKrmE/Dw
	DGwOOh5Ua0szMWbQlkX6ugUjWDYW+uKrVAVkIVzzBEC045uRmzbUlKM14E2tu7odawePwfyud/i
	BioZWLQUqB8k1F4b1sljNIGVLmHxlV4yfn0YAqpFp03hw4N4iYDxoC/ww08e2S+dd+Oi2Acx0FI
	Ff5KljXDfZ3cngH+qaf/WS8yA+sF8xiU1g6oM8cCYjfa0aBsiAi5bz/0O9B/ltu6JxgvVJ7aL6q
	G2wYWp7fwn6td7yZ932fdw5TIezgjwCdSdnwaoTQWPyaKK31u/3JCrHxUc/bL3x/Yk1MR2zS880
	EtkTHWRdo0Q43jQsWgBgbRbeJK7FNLP3uEa1ZTRlBxrFkpuBqmjdumsQ3Je7O89gd0U2/b91UfY
	gEvr0DdXT0KS8WjO2dVh+TKyPLae1CeXSaQWSywiJIg7C2QBZFag02Z2cp0csFkIK/qix20WeGa
	8JKGWlbkb07GXZ2QvA6YkeiqwW96QUrhriC6yGV4jJRUWIoHCF0+qQEgfB6wqu9IhcVJWaRdeRr
	5r8gks6c=
X-Received: by 2002:a05:600c:3b11:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4ba02357922mr35599775e9.34.1794311476364;
        Tue, 10 Nov 2026 03:51:16 -0800 (PST)
Received: from [192.168.68.73] (host-87-4-46-207.retail.telecomitalia.it. [87.4.46.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01feee1asm76370685e9.12.2026.11.10.03.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:51:15 -0800 (PST)
Message-ID: <59c8fa03-3ff1-4dd6-887b-d3c9044f2052@gmail.com>
Date: Tue, 10 Nov 2026 12:51:15 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Linux 7.4-rc2: Intel Meteor Lake SOF/HDA audio fails
 with ASoC route errors (-19)
To: Rujbin <rujbin@proton.me>, Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Alain Cousinie <alain.cousinie@laposte.net>,
 Linux Sound System <linux-sound@vger.kernel.org>,
 regressions@lists.linux.dev, Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
References: <mAZY9HZuXAXUf7zv8tqXquMtquf7iW2CIZB7WhU-SnwWp-Rpr0e8yixTsb3lAeQsO64PwwWlOao8aMjQ4hTKOQ6grCiNmaWZmFRXMdPICD8=@proton.me>
 <318f1745-acd7-430f-818b-c961987fe108@laposte.net>
 <1c28b5e3-7ddb-4e3d-a61b-a96aedd6eb50@leemhuis.info>
 <A2lXWpWj7wjBwPNTvCOh2-bCqRbX0Pb7od1dICr4c6SegAilwp8dERHk6riu7tj1b3XUMgcLnDDSP_8AoZAyj9VHm3NUkBB1NW2YPQfZLYY=@proton.me>
 <mSuMDKuVQS8ZjTjivGVr3SMDUYuxZDrlG8aM0vLajVxIN8eq7OJTwAtWLWgMGypqzNolhoAsat_-nBy0wAq09eap6nIDkUvCES32gFvZ7ng=@proton.me>
 <bC5e1B4L-OemXflaxyhu6hZVqEyiiGQ9_Q3cejRNYI2EMBnD6LC7sgT6bskk8FjeIwsbZviJBOmIGiz5t9xgfwAm9czm8ihYLGsqyVLHyjk=@proton.me>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <bC5e1B4L-OemXflaxyhu6hZVqEyiiGQ9_Q3cejRNYI2EMBnD6LC7sgT6bskk8FjeIwsbZviJBOmIGiz5t9xgfwAm9czm8ihYLGsqyVLHyjk=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 23:02, Rujbin wrote:
> Hi all,
> 
> Short update: the num_components explanation is now confirmed on
> hardware.
> 
> 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to the
> devm_kmalloc_obj() family") switched soc_new_pcm_runtime() to
> devm_kzalloc_flex(). __set_flex_counter() then sets the __counted_by()
> counter rtd->num_components to the allocated array size, but ASoC uses
> it as the number of populated components. With GCC >= 15 it therefore
> starts at 3 for "Analog Playback and Capture" instead of 0:
> snd_soc_rtd_add_component() writes past the array and
> for_each_rtd_components() stops at the first empty entry, so the routes
> fail with -ENODEV and no card is registered.
> 
> The fix is one line right after the allocation:
> 
>     rtd->num_components = 0;
> 
> A separate [PATCH] follows with the Fixes: tag.
> 
> Verified on v7.4-rc2 (commit 7475ea8b58616), same kernel build and
> machine, with only snd-soc-core.ko replaced:
> 
>                                unpatched     patched
>     ASoC: Failed to add route       18           0
>     fail to add hda routes           1           0
>     aplay -l                   no cards    sof-hda-dsp, card 0
> 
> card0 is registered, SOF firmware 2.14.1.1 boots, and there is no
> UBSAN, KASAN, oops or WARN in that boot. The loaded module's GNU
> build-id (ccb6a039...) is the rebuilt one, not the original
> (daa875d8...).
> 
> Caveats: the module was built as an external module, so the test kernel
> is tainted 0x3000 (OOT + unsigned); Secure Boot is off and
> CONFIG_MODULE_SIG_FORCE is not set, so this did not affect loading.
> CONFIG_KASAN was not enabled, so the out-of-bounds write itself remains
> a static finding. Tested on one machine (ThinkPad L16 Gen1,
> Meteor Lake-P, Conexant SN6140).
> 
> Thanks,
> Rujbin Nassereslam / zerox80
> rujbin@proton.me

Hi Rujbin, all,

I ran into the same issue and sent a fix here:
https://lore.kernel.org/all/20261109102536.357134-1-ghidoliemanuele@gmail.com/

I only noticed your report after posting it. Could you reply with your Tested-by?

Thanks,
Emanuele


