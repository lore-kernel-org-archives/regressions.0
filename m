Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C69161914
	for <regressions@lists.linux.dev>; Tue, 17 Sep 2024 10:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726567695; cv=none; b=dk3/eGzLJSBTi3Wdo1HkiXE0/rxyxd7yBw42xlydpAU9oR/0O9iL4bkNrmd4ZOvjLSXCEr79D0a/PJChirkQtcAdot8LpKTszcHpmym5aH0/G/dPJvD5FQkKqEU6WtK1XYLzOXHtcYT20p8WOjX8tKCOe+s9sHfcBmo/5VZpGI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726567695; c=relaxed/simple;
	bh=Zjuf7lESNXXXmJ1CBu0nQw9jUXCZZ0Wamegwacai9SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0Jbc0Jxk/xu57kv9C3PUYWH/UOJwGksqCKxi9frn2V5sVqdfGctU/h0ZhE3XeNpJe5HUEaqvwyUzpy419GEvroZJCvj1AiZ2wfB9DoYYZ/WtgMzoykW2ogPIBd1d6KpHYA4ZdQN9WZrkYe7DBMgWbp32poM0JWpLUDdkn+NdiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZ6jMEG3; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZ6jMEG3"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f761cfa5e6so43880341fa.0
        for <regressions@lists.linux.dev>; Tue, 17 Sep 2024 03:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726567691; x=1727172491; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KJbxN/BoBiYWDohSMCRDVcluwineaYIhEPM4cB3crFw=;
        b=KZ6jMEG3BnmKS6ACe4iRqy1iNYu4JnUUC3iN+qt3fIo3ykhaLrsyaTXh47is8JjQZl
         vLE4KzNQa9G/zIGb7Rn+Ro9NBckw8GgcFWNkCF0v9FYXx1QpZPcNqIE/Q8A9oEACkZjr
         jeH4LnATu37SuWeCZtDQZ+WqdDWWOUfuj2XqjxrNZmRD+X+iA7uBbhK+81NBjpqQYEqT
         BtaHHcXj3pvIJpyANAcyfyhOse2/lxMxqcS740SFYoREN2me8lmMfTkjJeT6ZbpoGwci
         WAqhXwsJGja3+8mphc6yl7M7IjLzapj7EC3JMRzaoA0vxxGTFxzl5M01EVRsa4HVx22q
         ta5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726567691; x=1727172491;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJbxN/BoBiYWDohSMCRDVcluwineaYIhEPM4cB3crFw=;
        b=nXc/IgQCYlslO370Q1qUFRUbc5+Hkyl7JrtVNlNVq+GALyFOcKPaTDX+91+zLXtSdt
         JsNBSmslS3HKAIfIOSEyDQhWkxHtt2YcQDU+vqrxWbG/uJS1Kec1YvLfV3Lp+hR1Fw6R
         +mT79abn/SVK2ZekiqQaHaw702uvsgBuTHJlWtUSnXV+B3aHiNVofDvPk7GndFq2sBq/
         tVDZjata7CH68rGFowZKMjW3zPACRzQbDOs9CJvpEr7WVPhhthcuzhNvt47r/ArEsvY4
         zCfDhuFRZTbc3KKhV7sj58Xu5kudZiRPs8MDKiYTx6/gy0QiVZWsFnwZmqGGLSWa9DmJ
         LdyA==
X-Forwarded-Encrypted: i=1; AJvYcCWIH+cfDRBgw1NRFA5K/Wat1Pw48G0f1QS3AWB8Vs/KrCMThuVYzAFQjVKRODZrow0Tv6lC2nOhknBLWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrTkQr+tKaFwhd+7uAd9iB7LR5OOAs8KQtdD2brKKAvVE6W2dm
	nFvv0bg/igN2jzIuTMupJeZjSLtRmD9H/YJKH813KTgQiKj9iTEF
X-Google-Smtp-Source: AGHT+IGiqzBAYFz/mDtE2N5VLwEzMkWQFs36XzIRE4/HfHEtFG+isbnI1S5WWQgrzxd2uMOGc0oGfQ==
X-Received: by 2002:a2e:e11:0:b0:2f7:53b8:ca57 with SMTP id 38308e7fff4ca-2f791a01ef2mr51657271fa.19.1726567690819;
        Tue, 17 Sep 2024 03:08:10 -0700 (PDT)
Received: from [192.168.0.10] ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b1947e2sm135592985e9.44.2024.09.17.03.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2024 03:08:10 -0700 (PDT)
Message-ID: <5823a50e-c607-4e1c-ba4d-d88b38c734cb@gmail.com>
Date: Tue, 17 Sep 2024 13:08:08 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG and WARNINGs from mt7921s on next-20240916
To: Felix Fietkau <nbd@nbd.name>, Kalle Valo <kvalo@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Deren Wu
 <deren.wu@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ma Ke <make24@iscas.ac.cn>,
 regressions@lists.linux.dev
References: <144fbf79-950c-4cd1-bc68-4e00b47b03e9@gmail.com>
 <ZujCwvd4XiwljDyv@lore-desk> <87ldzqdcsv.fsf@kernel.org>
 <b8e11bbc-c718-4acf-acc0-6b31f25fae27@nbd.name>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Language: en-US, tr, en-GB
In-Reply-To: <b8e11bbc-c718-4acf-acc0-6b31f25fae27@nbd.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2024-09-17 12:15 +03:00, Felix Fietkau wrote:
> On 17.09.24 08:17, Kalle Valo wrote:
>> Lorenzo Bianconi <lorenzo@kernel.org> writes:
>>
>>>> Hi,
>>>>
>>>> I ran into some bug messages while testing linux-next on a MT8186
>>>> Magneton Chromebook (mt8186-corsola-magneton-sku393218). It boots 
>>>> to the OS, but at least Wi-Fi and Bluetooth are unavailable.
>>>>
>>>> As a start, I tried reverting commit abbd838c579e ("Merge tag 
>>>> 'mt76-for-kvalo-2024-09-06' of https://github.com/nbd168/wireless")
>>>> and it works fine after that. Didn't have time to do a full bisect, 
>>>> but will try if nobody has any immediate opinions.
>>>>
>>>> There are a few traces, here's some select lines to catch your attention,
>>>> not sure how informational they are:
>>>>
>>>> [   16.040525] kernel BUG at net/core/skbuff.c:2268!
>>>> [   16.040531] Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
>>>> [ 16.040803] CPU: 3 UID: 0 PID: 526 Comm: mt76-sdio-txrx Not tainted
>>>> 6.11.0-next-20240916-deb-00002-g7b544e01c649 #1
>>>> [   16.040897] Call trace:
>>>> [   16.040899]  pskb_expand_head+0x2b0/0x3c0
>>>> [   16.040905]  mt76s_tx_run_queue+0x274/0x410 [mt76_sdio]
>>>> [   16.040909]  mt76s_txrx_worker+0xe4/0xac8 [mt76_sdio]
>>>> [   16.040914]  mt7921s_txrx_worker+0x98/0x1e0 [mt7921s]
>>>> [   16.040924]  __mt76_worker_fn+0x80/0x128 [mt76]
>>>> [   16.040934]  kthread+0xe8/0xf8
>>>> [   16.040940]  ret_from_fork+0x10/0x20
>>>
>>> Hi,
>>>
>>> I guess this issue has been introduced by the following commit:
>>>
>>> commit 3688c18b65aeb2a1f2fde108400afbab129a8cc1
>>> Author: Felix Fietkau <nbd@nbd.name>
>>> Date:   Tue Aug 27 11:30:01 2024 +0200                  
>>>
>>>     wifi: mt76: mt7915: retry mcu messages                                            
>>>                         
>>>     In some cases MCU messages can get lost. Instead of failing completely,
>>>     attempt to recover by re-sending them.
>>>      
>>>     Link: https://patch.msgid.link/20240827093011.18621-14-nbd@nbd.name
>>>     Signed-off-by: Felix Fietkau <nbd@nbd.name>
>>>
>>>
>>> In particular, skb_get() in mt76_mcu_skb_send_and_get_msg() is bumping skb users
>>> refcount (making the skb shared) and pskb_expand_head() (run by __skb_grow() in
>>> mt76s_tx_run_queue()) does not like shared skbs.
>>>
>>> @Felix: any input on it?
> 
> Sorry about that. Please try this patch, it should probably resolve this issue:
> 
> ---
> --- a/drivers/net/wireless/mediatek/mt76/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mcu.c
> @@ -84,13 +84,15 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
>   	mutex_lock(&dev->mcu.mutex);
>   
>   	if (dev->mcu_ops->mcu_skb_prepare_msg) {
> +		orig_skb = skb;
>   		ret = dev->mcu_ops->mcu_skb_prepare_msg(dev, skb, cmd, &seq);
>   		if (ret < 0)
>   			goto out;
>   	}
>   
>   retry:
> -	orig_skb = skb_get(skb);
> +	if (orig_skb)
> +		skb_get(orig_skb);
>   	ret = dev->mcu_ops->mcu_skb_send_msg(dev, skb, cmd, &seq);
>   	if (ret < 0)
>   		goto out;
> @@ -105,7 +107,7 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
>   	do {
>   		skb = mt76_mcu_get_response(dev, expires);
>   		if (!skb && !test_bit(MT76_MCU_RESET, &dev->phy.state) &&
> -		    retry++ < dev->mcu_ops->max_retry) {
> +		    orig_skb && retry++ < dev->mcu_ops->max_retry) {
>   			dev_err(dev->dev, "Retry message %08x (seq %d)\n",
>   				cmd, seq);
>   			skb = orig_skb;
> 

Tested-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>

Thanks!
