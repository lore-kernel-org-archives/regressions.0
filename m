Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F153101A7
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 19:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776972888; cv=none; b=UlZI+GxPT1GKFqADqseTj6Nfx/ljBygvEYcXWVD2zUOuBEX6vQ0PA2kzmmIZemu6IKz20IN0JyYxM3h5LtOrBcboOWpN3Od7/hLjJVNyTrjIaXneSU2n4x52sQUPonBzJIsnocY73BgH407Jk0Sia5ZkhMDR6F5WI5A9KJRmxSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776972888; c=relaxed/simple;
	bh=539Dj0pPYhwl2x+BzLZq+XdlgxBs17271S6FLl4Ch74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t/mMuSAohJShkAuRadRPrQAZnypr5IuGhMlK7ZyOIRTDBlix5+lG74SWpus6wlSEwkwOiOPaLKoJXbrpmEpeYlmy9zyGdQsP/2cCR7Db+LvJp+Y/TsP+N78CAzO6EoKcdmPQ8omyNVs6SB0HRr0FZlmDqfyTYPHsxuEmUIWfq+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4IjryUG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4IjryUG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so90099445e9.2
        for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 12:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776972885; x=1777577685; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SByx/RZF2gtg1snRuA3Fm71cYm2ogOemoitCIMC+OQA=;
        b=C4IjryUGrtHsg6KCjcQMy3LHkGyTZeEXnYfHwNm6WAtQbGFpAVuybpFp2oz8a4yktd
         8LNrC3la0jjZVCq6U0hrXpzxF1RCrnwgOLcGOW934GPY6DOA5RpROpm7A/ibpRufVKgU
         hEW9g1t2veh//VTSv7HOjtKJdbY5CKfUX1UNZyTXZJAjLzLfAuHjCqUuTFj91POcfoWO
         ToFJW5QV89jmyJbCdaJ2+/TGpEn7UTyH+MuNqh+jzZcL3I12pS75V4InzMIZ8BHkdt7O
         VjltPbpmS7LUhkHt3R4D/xjFZ4Ow0MTkeMu3Sb6j1qtvXPt04lCFTdqnKbaa5wqpLPfx
         0+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776972885; x=1777577685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SByx/RZF2gtg1snRuA3Fm71cYm2ogOemoitCIMC+OQA=;
        b=S2EsRCRyG8R+uXmmOl9FShlbQ50jetnBdcQGfz9SceVf1sdyDpQSmHxiOLqYaYb+JK
         MrmoiUegoHBpHMfabuCU7QNT/2DQbCVO047cNqoMwqxGgxUu9/P7BHHKpgJkqz5zwA1T
         CgnQMT+yD4OYZ25Il4V5V6awCIaPn9EODTjI3+N2q25t4aifeCDA+qjTqcPpJUbpZZ0d
         sI48r4hvZKy1fm5zNtZNfb01QK9q9ka0TDFsSnpy2gtRpbhUdNVwv2eR5+yyZz4ORFyx
         sn1LuyOcDBWC19Rv4J0pgd0sa1kfdaRHfyvQT5qx9DdxSLgfCuZgadRiAYG99O1TOHfs
         42bA==
X-Gm-Message-State: AOJu0YwYGoWH4x8/oFDBbmHwROlSGGEy+dEwTulYnFQZsGJ+5yIs/jqJ
	XcCAyfS6tFp/TIVFo1Yuys27uKo00/ClzMz4PtbFtPKmxfCVbmmVBCZm6UcQpA==
X-Gm-Gg: AeBDieuOwSeXoJ2EFyKjV/jNG7bnkv9M6jLJ/0ttoMpmrmnBDBUrtm5BY+tkRBWA87t
	vp0Wj/CWx1Kj9l3O/BXYc/keBbXiABFF9t2H14icfp3JvkMwjSpYTEITNnwzlEnspPfek8cIJ/1
	NpQUokKNykvIxxafWqvA427vu1ec2eY6Zka/VLRu8XJ0cpCLE+PdWJ7vDT8e9IwN7JTgzpQYNEC
	os7vqepmDykD2sh4xFMVrvD9a6VikdxTQi25GN3gVQGzbo+nOU3ePPV+y0LwP91M4L08iid1Auu
	OPLem2RI7gxo3ZtDQffCeLDssKWAGBSXJIDbHtIddQKj6Oeb21XV90fPV48QHJ5PY0B9jzn3lPx
	D04bAzoyzFaessXHTxElz/3ZPJRSTFjKpgXHAsts4LQDVg4r6hOmGwGPnBxbN60U39+Ox9TOurv
	SOZ1wnSx0S2u0ob67S0TKRuAjtIxk4gVLYGxT0eOXL
X-Received: by 2002:a05:600c:a086:b0:48a:568f:ae82 with SMTP id 5b1f17b1804b1-48a568fb009mr175288745e9.10.1776972885087;
        Thu, 23 Apr 2026 12:34:45 -0700 (PDT)
Received: from [192.168.1.50] ([81.196.40.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm136756605e9.26.2026.04.23.12.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 12:34:44 -0700 (PDT)
Message-ID: <ae18ae17-2c12-4d8f-bc73-122bdc45433c@gmail.com>
Date: Thu, 23 Apr 2026 22:34:42 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rtw-next v2 5/5] wifi: rtl8xxxu: Enable 40 MHz width by
 default
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Jes Sorensen <Jes.Sorensen@gmail.com>,
 art1310@proton.me
References: <c54a69c8-9c7a-4249-ac9c-8d6544483ae9@gmail.com>
 <4f053103-adfd-4ead-acb3-ef69127a4bab@gmail.com>
 <8a4c664f-231f-437e-b010-b741c7ed7be8@leemhuis.info>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <8a4c664f-231f-437e-b010-b741c7ed7be8@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/04/2026 16:39, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 11/20/25 15:13, Bitterblue Smith wrote:
>> 40 MHz support is hidden behind the ht40_2g module parameter with
>> this comment:
>>
>> /*
>>  * Some APs will negotiate HT20_40 in a noisy environment leading
>>  * to miserable performance. Rather than defaulting to this, only
>>  * enable it if explicitly requested at module load time.
>>  */
> 
> FYI: this patch causes a regression that was reported to bugzilla
> (reporter CCed here): https://bugzilla.kernel.org/show_bug.cgi?id=221394
> 

Hi Thorsten,

Thanks for letting us know. I replied at the Bugzilla.

> """
> Since kernel 6.19.0, the rtl8xxxu driver fails to maintain a connection
> with the Realtek RTL8188FTV (0bda:f179) USB Wi-Fi adapter. The device
> gets stuck "configuring interface" and eventually times out, effectively
> disappearing from the network manager.
> 
> Regression Window:
> Works perfectly on: 6.12.x (LTS) and 6.18.x (LTS and non LTS).
> Broken on: 6.19.x, up through 7.0.0.
> 
> Notes:
> - The device remains visible on the USB bus (lsusb still shows 0bda:f179).
> - The wlan0 interface is created.
> - NetworkManager attempts to associate, but authentication times out.
> - Disabling USB autosuspend (usbcore.autosuspend=-1) does not resolve
> the issue.
> 
> Hardware:
> Bus 001 Device 002: ID 0bda:f179 Realtek Semiconductor Corp. RTL8188FTV
> 802.11b/g/n 1T1R 2.4G WLAN Adapter
> """
> 
> Then later:
> 
> """
> I confirmed that the Commit dbf9b7b "wifi: rtl8xxxu: Enable 40 MHz width
> by default" is the cause of the regression.
> 
> I tested passing cfg80211_disable_40mhz_24ghz=1 to the cfg80211 module
> on 6.19.x and 7.0, and the adapter works perfectly again.
> 
> In Windows, forcing the adapter to 20_40MHz causes it to be unable to
> connect to any AP, and it only works in 20MHz mode. In Linux 6.19+, it
> gets stuck configuring the interface and crashes. So this is most
> probably a hardware issue.
> """
> 
> Ciao, Thorsten
> 
>> This parameter was added in commit 26f1fad29ad9 ("New driver:
>> rtl8xxxu (mac80211)"). Back then rtl8xxxu only supported RTL8723AU
>> and the RTL8192CU family. It's entirely possible the miserable
>> performance was due to mistakes in the channel switching function,
>> which were fixed in a previous patch.
>>
>> Delete the ht40_2g module parameter. If someone still needs to
>> disable 40 MHz support, cfg80211 has the module parameter
>> cfg80211_disable_40mhz_24ghz. That works too.
>>
>> Signed-off-by: Bitterblue Smith <rtl8821cerfe2@gmail.com>
>> Reviewed-by: Ping-Ke Shih <pkshih@realtek.com>
>> ---
>> v2:
>>  - Add Reviewed-by.
>> ---
>>  drivers/net/wireless/realtek/rtl8xxxu/core.c | 19 ++++---------------
>>  1 file changed, 4 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wireless/realtek/rtl8xxxu/core.c
>> index a18f73aea837..c06ad064f37c 100644
>> --- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
>> +++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
>> @@ -20,7 +20,6 @@
>>  #define DRIVER_NAME "rtl8xxxu"
>>  
>>  int rtl8xxxu_debug;
>> -static bool rtl8xxxu_ht40_2g;
>>  static bool rtl8xxxu_dma_aggregation;
>>  static int rtl8xxxu_dma_agg_timeout = -1;
>>  static int rtl8xxxu_dma_agg_pages = -1;
>> @@ -45,8 +44,6 @@ MODULE_FIRMWARE("rtlwifi/rtl8192fufw.bin");
>>  
>>  module_param_named(debug, rtl8xxxu_debug, int, 0600);
>>  MODULE_PARM_DESC(debug, "Set debug mask");
>> -module_param_named(ht40_2g, rtl8xxxu_ht40_2g, bool, 0600);
>> -MODULE_PARM_DESC(ht40_2g, "Enable HT40 support on the 2.4GHz band");
>>  module_param_named(dma_aggregation, rtl8xxxu_dma_aggregation, bool, 0600);
>>  MODULE_PARM_DESC(dma_aggregation, "Enable DMA packet aggregation");
>>  module_param_named(dma_agg_timeout, rtl8xxxu_dma_agg_timeout, int, 0600);
>> @@ -4896,8 +4893,7 @@ rtl8xxxu_bss_info_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
>>  				sgi = 1;
>>  
>>  			highest_rate = fls(ramask) - 1;
>> -			if (rtl8xxxu_ht40_2g &&
>> -			    (sta->deflink.ht_cap.cap & IEEE80211_HT_CAP_SUP_WIDTH_20_40))
>> +			if (sta->deflink.ht_cap.cap & IEEE80211_HT_CAP_SUP_WIDTH_20_40)
>>  				bw = RATE_INFO_BW_40;
>>  			else
>>  				bw = RATE_INFO_BW_20;
>> @@ -7851,7 +7847,8 @@ static int rtl8xxxu_probe(struct usb_interface *interface,
>>  	sband->ht_cap.ht_supported = true;
>>  	sband->ht_cap.ampdu_factor = IEEE80211_HT_MAX_AMPDU_64K;
>>  	sband->ht_cap.ampdu_density = IEEE80211_HT_MPDU_DENSITY_16;
>> -	sband->ht_cap.cap = IEEE80211_HT_CAP_SGI_20 | IEEE80211_HT_CAP_SGI_40;
>> +	sband->ht_cap.cap = IEEE80211_HT_CAP_SGI_20 | IEEE80211_HT_CAP_SGI_40 |
>> +			    IEEE80211_HT_CAP_SUP_WIDTH_20_40;
>>  	memset(&sband->ht_cap.mcs, 0, sizeof(sband->ht_cap.mcs));
>>  	sband->ht_cap.mcs.rx_mask[0] = 0xff;
>>  	sband->ht_cap.mcs.rx_mask[4] = 0x01;
>> @@ -7860,15 +7857,7 @@ static int rtl8xxxu_probe(struct usb_interface *interface,
>>  		sband->ht_cap.cap |= IEEE80211_HT_CAP_SGI_40;
>>  	}
>>  	sband->ht_cap.mcs.tx_params = IEEE80211_HT_MCS_TX_DEFINED;
>> -	/*
>> -	 * Some APs will negotiate HT20_40 in a noisy environment leading
>> -	 * to miserable performance. Rather than defaulting to this, only
>> -	 * enable it if explicitly requested at module load time.
>> -	 */
>> -	if (rtl8xxxu_ht40_2g) {
>> -		dev_info(&udev->dev, "Enabling HT_20_40 on the 2.4GHz band\n");
>> -		sband->ht_cap.cap |= IEEE80211_HT_CAP_SUP_WIDTH_20_40;
>> -	}
>> +
>>  	hw->wiphy->bands[NL80211_BAND_2GHZ] = sband;
>>  
>>  	hw->wiphy->rts_threshold = 2347;
> 
> #regzbot introduced: dbf9b7b
> #regzbot title: wifi: rtl8xxxu: 40 MHz mode breaks things (just like in
> Windows)
> #regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=221394

