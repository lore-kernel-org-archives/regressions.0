Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15169148856
	for <regressions@lists.linux.dev>; Tue,  2 Jul 2024 07:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719905324; cv=none; b=T1OfgvqKX2XW0R68JErCpXByAkWx3T3528HfmEzP0vuq5WxEmORU5RabVqW498Np6c14Ny667i+X2UEDD27wRwgFyfE4QwLXPKVp1cQBf9NvaComLOb05liXbnJ+ChAUVe+v/9/576QqGKUnMcGVmLLxc1LUrh4vFfEdV7G5G+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719905324; c=relaxed/simple;
	bh=vsqePUHcK0fv7suLmKyy9AE69S893Nx2DFSfYA7/48Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OoxRegWOymJwRKq3s6PFL6Ev2Ijn4MrfeoUdVPo29n5V2ppJl+2Ebdh5V6kWW2aybLvVaxJ1i+DLKmlzqHnGhpK0v5qDF3gNTRfOnAHkxA6EJoEMJiUMZ0yNfZDzOyxJG+4V1+OBFlk0gALHuhWBrEpCPB+BEMb2TKkUJtFi5oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Raa+3UKz; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Raa+3UKz"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a724a8097deso465481866b.1
        for <regressions@lists.linux.dev>; Tue, 02 Jul 2024 00:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719905321; x=1720510121; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZjkiIMimDM469BE4g0PtLb2eLPRo0mVKPcjnEkFhjs0=;
        b=Raa+3UKzIG2iIDcPEDSH2k5UuUJ7Lwy8vDA77RON9EtoPhfeoj6yKdg7nQBv2t5fFA
         3E9l7PTVh9YH3KgtQnCbi6lJUxolxFf1MufC403IlvOPM5Y1borc+RUpqTkgwqA3tZ2+
         10QVpMIuL9dwu+MaoPjB/LojUBIVvLpHufrJHVtBBNo1DLQWrs3QIOPuLfNKOh855p2M
         ELhZMCLKr1eas/qN6r8JGx6HMDUR0L9s7RTL9aglZLMQQM2fAOVYpJjmXYRJrvqW2E4J
         UZXNlhFBmRtlrVNr5QK6ihqHiMuFimmxpX57qzSxVujfTUPgA9Nge7NywhatP/+RQIb0
         jMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719905321; x=1720510121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjkiIMimDM469BE4g0PtLb2eLPRo0mVKPcjnEkFhjs0=;
        b=BX4nXi2UZw/LwG4dBgFgwaul1XOO6jxrolnPP3pubjUfiRjO6aaGYLyMdNhJcJV17v
         gk0OWRgddMMJVGzDFwC0mQd9oBWqCAcXyUWim2jebdUmi3cDMDgjOi1DlAd+axsbpd80
         dIhqLkCKVyl4yCMEl4vNt1r/SSpzI/GKb0YB6M0923MjuKWXooGijuEeaY8Yew5vr0WU
         XDA2hAC9bIgY7a/dXgB5SRxYVntognb3+VpWTcfSTrWVjium7ZBkZ9B0D5UkzsXfUE5y
         D6Gf8z7bWoIyn49S7lD4QmxLKHQLhVd5R5j4RRrvuJ0FtDE/zENPAMQvMVF2I+YADbDg
         CEfw==
X-Forwarded-Encrypted: i=1; AJvYcCU2ZeJ3QEFruP0D+SkWiZLOfmgScCX64xZLCDQg/IbgkMiikPue0TmI8H3Kd+x8HCD2n5ee0jkGoJGz2c9Gn6pQrc0HQGvYR89uEm8=
X-Gm-Message-State: AOJu0YyrnGp7NBTG9PnRZgjqmx/lbW5K4uwX7HelijdwCKS73RVOqqYG
	/D6gGNIEOdA9l9EyPSicav8Lv19OkCc+uKcheQQG0vqm1nqkMNA7
X-Google-Smtp-Source: AGHT+IEqfipeae6eXqvRg9I/YLGEBz4jcyUx09ob+ngbQXPCuRclXOGmihGS1vdIK2VK9uvDeeqapg==
X-Received: by 2002:a17:906:d7a2:b0:a72:7da4:267c with SMTP id a640c23a62f3a-a751440237fmr490569466b.12.1719905321190;
        Tue, 02 Jul 2024 00:28:41 -0700 (PDT)
Received: from ?IPV6:2a02:908:1980:aac0::f4a9? ([2a02:908:1980:aac0::f4a9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7525fb8387sm166302366b.94.2024.07.02.00.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 00:28:40 -0700 (PDT)
Message-ID: <81aa100e-044c-4ea8-a2ff-cd34711e137e@gmail.com>
Date: Tue, 2 Jul 2024 09:28:39 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ACPI: processor_idle: Fix invalid comparison with
 insertion sort for latency
To: Kuan-Wei Chiu <visitorckw@gmail.com>, rafael@kernel.org
Cc: lenb@kernel.org, mario.limonciello@amd.com, akpm@linux-foundation.org,
 jserv@ccns.ncku.edu.tw, alexdeucher@gmail.com, regressions@leemhuis.info,
 linux-acpi@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <CAJZ5v0iY=S+WKWvDAAWxLcOwvpOG5Cck1gQv4p+FfW1Nca0Yqw@mail.gmail.com>
 <20240701205639.117194-1-visitorckw@gmail.com>
Content-Language: en-US
From: Julian Sikorski <belegdol@gmail.com>
In-Reply-To: <20240701205639.117194-1-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 01.07.24 um 22:56 schrieb Kuan-Wei Chiu:
> The acpi_cst_latency_cmp comparison function currently used for sorting
> C-state latencies does not satisfy transitivity, causing incorrect
> sorting results. Specifically, if there are two valid acpi_processor_cx
> elements A and B and one invalid element C, it may occur that A < B,
> A = C, and B = C. Sorting algorithms assume that if A < B and A = C,
> then C < B, leading to incorrect ordering.
> 
> Given the small size of the array (<=8), we replace the library sort
> function with a simple insertion sort that properly ignores invalid
> elements and sorts valid ones based on latency. This change ensures
> correct ordering of the C-state latencies.
> 
> Fixes: 65ea8f2c6e23 ("ACPI: processor idle: Fix up C-state latency if not ordered")
> Cc: stable@vger.kernel.org
> Reported-by: Julian Sikorski <belegdol@gmail.com>
> Closes: https://lore.kernel.org/lkml/70674dc7-5586-4183-8953-8095567e73df@gmail.com/
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> v3 -> v4:
> - Rename the parameter 'arr' to 'states'.
> - Add empty lines to enhance readability.
> 
> Note: I only performed a build test and a simple unit test to ensure
>        the latency of valid elements is correctly sorted in the randomly
>        generated data.
> 

Hello,

thanks for the patch. I have tested this applied on top of Fedora 6.9.7 
kernel on my Asus laptop and the message about suspend not reaching the 
deepest state is gone. Thank you.
I wonder whether this will also fix random S3 suspend issues I have been 
seeing on my 5600x since 6.9 kernel too. I will definitely try.

Best regards,
Julian

Tested-by: Julian Sikorski <belegdol@gmail.com>

>   drivers/acpi/processor_idle.c | 37 +++++++++++++++--------------------
>   1 file changed, 16 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
> index bd6a7857ce05..831fa4a12159 100644
> --- a/drivers/acpi/processor_idle.c
> +++ b/drivers/acpi/processor_idle.c
> @@ -16,7 +16,6 @@
>   #include <linux/acpi.h>
>   #include <linux/dmi.h>
>   #include <linux/sched.h>       /* need_resched() */
> -#include <linux/sort.h>
>   #include <linux/tick.h>
>   #include <linux/cpuidle.h>
>   #include <linux/cpu.h>
> @@ -386,25 +385,24 @@ static void acpi_processor_power_verify_c3(struct acpi_processor *pr,
>   	acpi_write_bit_register(ACPI_BITREG_BUS_MASTER_RLD, 1);
>   }
>   
> -static int acpi_cst_latency_cmp(const void *a, const void *b)
> +static void acpi_cst_latency_sort(struct acpi_processor_cx *states, size_t length)
>   {
> -	const struct acpi_processor_cx *x = a, *y = b;
> +	int i, j, k;
>   
> -	if (!(x->valid && y->valid))
> -		return 0;
> -	if (x->latency > y->latency)
> -		return 1;
> -	if (x->latency < y->latency)
> -		return -1;
> -	return 0;
> -}
> -static void acpi_cst_latency_swap(void *a, void *b, int n)
> -{
> -	struct acpi_processor_cx *x = a, *y = b;
> +	for (i = 1; i < length; i++) {
> +		if (!states[i].valid)
> +			continue;
>   
> -	if (!(x->valid && y->valid))
> -		return;
> -	swap(x->latency, y->latency);
> +		for (j = i - 1, k = i; j >= 0; j--) {
> +			if (!states[j].valid)
> +				continue;
> +
> +			if (states[j].latency > states[k].latency)
> +				swap(states[j].latency, states[k].latency);
> +
> +			k = j;
> +		}
> +	}
>   }
>   
>   static int acpi_processor_power_verify(struct acpi_processor *pr)
> @@ -449,10 +447,7 @@ static int acpi_processor_power_verify(struct acpi_processor *pr)
>   
>   	if (buggy_latency) {
>   		pr_notice("FW issue: working around C-state latencies out of order\n");
> -		sort(&pr->power.states[1], max_cstate,
> -		     sizeof(struct acpi_processor_cx),
> -		     acpi_cst_latency_cmp,
> -		     acpi_cst_latency_swap);
> +		acpi_cst_latency_sort(&pr->power.states[1], max_cstate);
>   	}
>   
>   	lapic_timer_propagate_broadcast(pr);

