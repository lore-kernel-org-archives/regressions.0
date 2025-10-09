Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7466B78F59
	for <regressions@lists.linux.dev>; Thu,  9 Oct 2025 14:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760018697; cv=none; b=RAkWPYArUvP6nwhHgfJyTAL1K3KlRkEzofl2OgbZfPYASVfuDUn6oiNkLWJYrnvk2gwKeHVfiCz6QoUUaN0f869f3sawiDBviLp2mwVvOR8XtITLQYhAN1Xbt3okOTkuyFlD1mSk8LbWSOiD9X7izwN/Ta02PhXqJ7LEfxzucvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760018697; c=relaxed/simple;
	bh=HFz+DzsAHHYBSi6GUFx67A7OgctCJkmIJ99bn/U5o6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iAJfK2kdhkE7yojleLHK22c1vKHosAH+Khoisy/mvZ6Xhq9wRS3nVB0DFCVoaiSfI95ofY2RYYJroqdd3HA6QLjThNs/7UxZXeHtikbtpfyQDQr2NV4EPwMDoUo7saRmmG8SexCydvUZyg5pUYCiLNcvJ4vjL1OqCDG9uVNzWiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=geoffthorpe.net; spf=pass smtp.mailfrom=qclibre.com; dkim=pass (1024-bit key) header.d=geoffthorpe.net header.i=@geoffthorpe.net header.b=RLjzq7Fx; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=geoffthorpe.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qclibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=geoffthorpe.net header.i=@geoffthorpe.net header.b="RLjzq7Fx"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-77fac63ba26so9799917b3.3
        for <regressions@lists.linux.dev>; Thu, 09 Oct 2025 07:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=geoffthorpe.net; s=myprefix; t=1760018694; x=1760623494; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RdqKy9G6bRtRu/wXq/+0Le+P5mZ0KkhEVzNICvjTdJs=;
        b=RLjzq7FxvKU2ku+r588UBWtUUwlAb0va5otPd+bSpo+g8LgEfccEYDYebG8mRgzGLH
         29lGn5zMzGcS11hwrMkALalcjjGyfeNHQZ9Kk7+bZDE1RCUvvS7kJDcy3wjzfrfPE0zx
         goIZ3wYLQAqh/LwYFVIPBcXsjCPOJrls4HV9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760018694; x=1760623494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RdqKy9G6bRtRu/wXq/+0Le+P5mZ0KkhEVzNICvjTdJs=;
        b=RFvQaeI13UMml9C3fmisp9EO+6oXKU3UKdmHr43/8oRWhn7Y88fU9Lxf9jt8mr9H0E
         jold6073UC9ey4Eh9s1O2csI7o/gH6SLPGRmKRTi5yRDNxxfaIQJ4nB4M5cYvLSF2Y/r
         +bVmHyTvW4DXQfqQzcS6DhDcQp/AXItnWo8N/F/MECgTmuNM8mTDPjjGMMa3ckqyxE3r
         E7wDfvt1GfkUuGZSHS/12ZRFMj6NRNrgn1LgL8MUabqdbnrWX1KqPi+lAHskjGAmJtCM
         VlzHwm+ccjrDDRIERMKmtJ4jZaFaUqdzImEN3OWM/8TDVf2UjMHQuzvwiwy1nCPdbclZ
         f8xw==
X-Forwarded-Encrypted: i=1; AJvYcCW7rRWfrZl15pqMR0L+pX0i/Q0wU6W/1x88aH9PdM5C4D14HZzW0nvpAMcgsYTV+U2cwWIruZA4QDZU3A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKvxHFJ4/xjSLzNzxX73ITDWvlwE2H6YdjOY68115Pbyzhp3h8
	yydSXByUX5jJx2e4HzdAhc5047aS9BAVtVObRdlKAEmPU6pKLPM86eEldvVbXL2mJgHa/gv3R1F
	QF34pP6TVBQ==
X-Gm-Gg: ASbGncsiPu7LL2eoCWs0FvJsgQWhzcjsiORcFczVAMqTeP7O93lFRcyri0TZq//JI//
	MNFJhVgJKO+LeowRCUtmHjQvpQILhIusk7Le8Qi2HIQDoa84t/Nk9xWbJGUy5wE4RAhG6bTd6Zg
	aTevUfXCra3M2uRStcorZWmk7Cs4TpGQbj9uRiXoTQ5h4eCC1nR0ZelKKbmBr7wH6MxXs5GNSH6
	qZSXn9u8fWk66OIndJiCx+lf8h0mMhUkmkbm2rtJuPSumMO3QUJ+foI9bUpGzF81zPUwogOlwbV
	jkygJWjnwjqZJAmityTo2Cen6QTqHREF9/uMmU1JAnX/a2NO+xTZkhov9BDm5dvjaD6bkGCzIaG
	+cYTLmw/XXcVEsL6vqQDr3p6ZCrgNZMl2Q2fpG3VDWp8qs4xP95210zuGpzJMZREBaYOJDMfCbm
	bInYxIhkNYlyN3Dg==
X-Google-Smtp-Source: AGHT+IEy3Zpk1t7I8Y9go0VYl6eLttKJfqUkxmv9wH5m56XMkNIzUJ4aTQJcvW0kxxWmFap74ApUMg==
X-Received: by 2002:a05:690c:46c5:b0:772:2b5e:1f10 with SMTP id 00721157ae682-780e13f4996mr97210717b3.1.1760018694426;
        Thu, 09 Oct 2025 07:04:54 -0700 (PDT)
Received: from [10.0.0.3] (modemcable155.19-201-24.mc.videotron.ca. [24.201.19.155])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f2e1db1sm200301485a.4.2025.10.09.07.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 07:04:53 -0700 (PDT)
Message-ID: <028786fa-8964-4dd1-8721-62a5b757237c@geoffthorpe.net>
Date: Thu, 9 Oct 2025 10:04:52 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: regression in hostfs (ARCH=um)
To: Hongbo Li <lihongbo22@huawei.com>, stable@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>, regressions@lists.linux.dev
References: <CAH2n15x389Uv_PuQ8Crm7gg4VC0UZ3kJg+eEfHMy8A6rzUtUAA@mail.gmail.com>
 <75a53a17-b5fe-441e-8953-8c1d5e7ca47a@huawei.com>
Content-Language: en-US
From: Geoffrey Thorpe <geoff@geoffthorpe.net>
In-Reply-To: <75a53a17-b5fe-441e-8953-8c1d5e7ca47a@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-10-08 22:42, Hongbo Li wrote:
>
> Hi Geoffrey,
>
> On 2025/10/9 7:22, Geoffrey Thorpe wrote:
>> Any trivial usage of hostfs seems to be broken since commit cd140ce9 
>> ("hostfs: convert hostfs to use the new mount API") - I bisected it 
>> down to this commit to make sure.
>>
>
> Sorry to trouble you, can you provide your information about mount 
> version and kernel version (use mount -v and uname -ar) ?


root@localhost:~# mount --version
mount from util-linux 2.41 (libmount 2.41.0: selinux, smack, btrfs, 
verity, namespaces, idmapping, fd-based-mount, statmount, statx, assert, 
debug)

As for the kernel version, I have been bisecting different kernel 
versions to find the culprit commit. The problem occurs with the commit 
id I mentioned (cd140ce9: "hostfs: convert hostfs to use the new mount 
API"). This appears to be between v6.10 and v6.11. The most recent 
kernel releases all seem to exhibit the problem. My own code has been 
using kernel v6.6 up till now and that works fine.

By the way, did you try using the steps to reproduce? No pressure to do 
so, I am just curious if the instructions I provided work OK for other 
people (or whether I missed something essential). If you do follow those 
steps, you should be able to see success if you use v6.6 or older, and 
you should see failure with anything newer.

(Side note: when bisecting, I noticed that a number of commits had to be 
skipped because they seg-faulted during early boot. Fortunately, that 
didn't prevent me from finding the culprit. I mention this just in case 
you stumble across a commit that seg-faults too - it appears that's 
unrelated to the current regression.)

Regards,
Geoff


