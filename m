Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06303F9D2
	for <regressions@lists.linux.dev>; Sat, 21 Dec 2024 09:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734774780; cv=none; b=u5JH9a6BOiTYyQrqDfqHvZ6gKaWJ6K1yfyzzcoaU9dNf25dI1JhyeojudPdPB/XGXvY2j0Xpl4diEzY0AxYI9eZfwkndi5yOmkA9VPXGRuoFz/ZiSW5USAXd/IuHHTCfF7tQ72Fn0vbpQdJEmmqSFKLOtflSFl6xW1Uqd3Pl4GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734774780; c=relaxed/simple;
	bh=DeopnxgzWv0Cqe0zQdIGhe7mTeKy3V4rGekfmmHMBXM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qnfX0XkvSU7iwlMuSTCwUMKqN+slCiuUyyhXD8ZtUZKUAX5UnqArtbWhPiHMff0QRQf3hZukcW7/jOhOTL8LQCr4n42p40KFAo4i50r/SebngWLF4u3DHv77XN91yRVldJS40oeuQifNMrsjJLPjjTVcQRM/VH1Y3d6Rxtj24qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQAJgZlA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQAJgZlA"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43626213fffso23370155e9.1
        for <regressions@lists.linux.dev>; Sat, 21 Dec 2024 01:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734774777; x=1735379577; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F7wU5N3Rc+yxdkSrB3ZsiwvxSqXteUyf9TiI9dS8GWc=;
        b=NQAJgZlAo9FRnNP0PxDXqk1wa71iqHKVaKLCcs2/Qe0d6syZJDDOApU//QnhWg4K2V
         WAGPfTmiOPMw4avJEf7ctZvrJQsa1eW9LHzf4QFmQui0LYgSYt6dUihPBYNleGnDF3xD
         fJ1inV5EBBtImV2EIx+5XH5Mcq5xrGTcMjG7uW++UMUt0PaPvIEAmXKkVtagjOKz5T8c
         vOsKZo0yjfQ2DKKAcCjkEcqsPdPqbdouslEptcmVo8EttIGrRK/TLShwMcxSbSz/aChH
         eGYiRYWgvnZasSH5R6cOvjGDi9hFOJByhm/qG+O2ADuCfYqy5Snfhzdc4+z+rQJHHLZE
         ecug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734774777; x=1735379577;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F7wU5N3Rc+yxdkSrB3ZsiwvxSqXteUyf9TiI9dS8GWc=;
        b=q+QxH4c4+ZFFGVVTbKX0c+Hdw8RJx3FvcT1JLHTgk3J6fdRk4Wkp0wG11Lp70la67N
         CYNsoMe4W7ID3uGtmP0tCrrkBGVRST9Jnr4tVgsBqnQ3kX3lKsxvthL83gU5FJCQjJVz
         Ezj/U6jLS32cd613zsg/+Rg+OdnhWVRaQC64r9NoEWkj0BiSP8zdg+upHFW8eiYyw4zI
         0Xw3UUrWA9gQvqKnDMOsu784/YfZuHg6WT26pTkT25cAiu+KOqcyICRqnXs4dU0rPgIz
         2W3KF/cNkNvGQu3fsN7/xCu+nGSugoPn7YY2cRiItljR4JprChP2id6Tn42V2SQOE5Hw
         nHKA==
X-Forwarded-Encrypted: i=1; AJvYcCXHjCQZXvqC61fip2AIWAkUT9sMKXxNBYlaNfEzBkApaJQyPjyiYJrsrZ70eyh1wiWmJD8W8xbzExxEXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSnqxoelSRzP3lMQNsk1FlT6SduaVpiRWWXA4ofd1hNTclTUY+
	ne5GhGCvCN5R5ssSiEmTICn+dtYo3gzAs9ZoBzFLQedBjOvxRRTh
X-Gm-Gg: ASbGncuVRAvrWaaCSAxaN/ZfPvprXvvgpfc7alyI8vXPyskJJVyIEIU7YURIwy8YOsU
	JzYOC79thjop4PXkVk5tdmSuPrv26ptYqamKstwsIgrtsT1oU0hW6HsFHeyustKcF9EBKmN3V8k
	oQP/S4g7sJRgANDRTYv7cjKMnJk617VxLXvWGTrMq9E4WlHpu20eaS3tad1HrDJUJiXZJAt3AVT
	pzVzJ1VtgZyMNFxyvFVxkjCuHswOEbHBSMQmoqqGNGC+IIazFTDFr1KegqBHBOI1IDCjFyTSq3B
	+jaMosG1sMcpryUQHGYtqBiS2UIQ8ErutFugwZQ=
X-Google-Smtp-Source: AGHT+IHjxLdXW8mbGjkft5APD+lMWkYg/9/MWVjfMYYRs7EuMja17eWwm0wb+Q5Gfbj7nNRta4GP2Q==
X-Received: by 2002:a05:600c:4f89:b0:431:15f1:421d with SMTP id 5b1f17b1804b1-4365fc09731mr81614135e9.16.1734774776704;
        Sat, 21 Dec 2024 01:52:56 -0800 (PST)
Received: from [192.168.10.194] (net-188-216-175-96.cust.vodafonedsl.it. [188.216.175.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436612899f0sm70967715e9.38.2024.12.21.01.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 01:52:56 -0800 (PST)
Message-ID: <1eeecc68-be5f-46e6-aed6-594c4b32df21@gmail.com>
Date: Sat, 21 Dec 2024 10:52:54 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] bluetooth: mt7921: Crash on Resume From Suspend And
 Hibernate
From: Sergio Callegari <sergio.callegari@gmail.com>
To: jglotzer@gmail.com
Cc: Aaron.Hou@mediatek.com, Chris.Lu@mediatek.com, Deren.Wu@mediatek.com,
 Hao.Qin@mediatek.com, Sean.Wang@mediatek.com, johan.hedberg@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, luiz.dentz@gmail.com,
 marc.payne@mdpsys.co.uk, marcel@holtmann.org, regressions@leemhuis.info,
 regressions@lists.linux.dev, steve.lee@mediatek.com, tiwai@suse.de
References: <20241127231432.8112-1-jglotzer@gmail.com>
 <ad78ad62-ebd2-40d7-8a6d-623ae947584c@gmail.com>
Content-Language: en-US, it-IT
In-Reply-To: <ad78ad62-ebd2-40d7-8a6d-623ae947584c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 06/12/2024 03:29, John Glotzer wrote:
 > Sergio,
 >
 > My apologies, I neglected to mention that my setup is PCI, and not USB.
 >
Thanks for confirming, good to see that the issue can be reliably 
reproduced with a setup similar to mine!

 >
 > What I am struggling to understand is given how easy this issue is to 
reproduce -  an AMD CPU, Mediatek MT7922 wifi/bluetooth chip,
 > and a 6.11 kernel, you suspend, and then wake up, kernel panics -  I 
would have thought that the interested parties would
 > make this a priority.
 >
I wonder it it might be possible to revert back to the code in kernel 
6.10 (that worked fine), until the current issue can be triaged and fixed.

The other way round, I am getting the impression that other changes are 
getting stacked on top of the faulty ones, further complicating the picture.

As of today, with kernel 6.11.11, the issue has /worsened/ for me. On 
6.11.4 I could hibernate/resume by kfkilling bluetooth only, which was 
not so bad, since I only use bluetooth rarely. With 6.11.11 I need to 
rfkill the wlan too.

Can this be confirmed too?

Sergio

