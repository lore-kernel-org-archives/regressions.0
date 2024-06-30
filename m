Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEBA2AE68
	for <regressions@lists.linux.dev>; Sun, 30 Jun 2024 21:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719782028; cv=none; b=BhYHUt0JPCUt5aiymx2TfJHcA0ab1RrnVxs8EuaMR4X04Z2Z71Kokv6jZvqV4a9pUDAeriTis7wdbTfBvmFMLqbYXOWg6k8h5z9k5ZyFCEir11hKBKJoBIAOiCmcYlR5TOH271oknXbulrc6ZdcuzB+I0nhNtu13xDqUFXOhe5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719782028; c=relaxed/simple;
	bh=rrGAkHp6yz56bzzoabSlg7wA/pYZ84y3v4eNyqhO+18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYF/9jH6bhU3YlIk+bs6b7+LKc8Kte8Ibuh7PpoXjjb1Kjc0b4SQcTPp34XTXgIvxFIk0FTSMi6c40WnRn91a8Kg+QLcMkxpiKK9W7MFbOROD3wWrS/4NISsEc5/o0uSiD1yPlsIeF95PXOXQ+Mf4OdzCuQ1AZMNmW1UmlDUMD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdxEq7JP; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdxEq7JP"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2c7e2382b94so460753a91.3
        for <regressions@lists.linux.dev>; Sun, 30 Jun 2024 14:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719782026; x=1720386826; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWboog+rqvm9Ox6aVkr8ZlT55isuINvZAP74QVmennY=;
        b=VdxEq7JPemk98eRw6gi87MeXGYzzOPbKsZylTESY/OycwHA8Ll/94fkznH0dkUZkeC
         JLQ1FdoOKHU0d1URO3+NtCETreI/6bvSKz4eV+n5H9H0q3/3wjYl7kI5bHfi9dmehAe4
         FdkHLDckd9goOprWcwKi8sa53/FLJ7zvAL7P78vk5iDCYM9naY12B8N27s/fl+LueW08
         P+S6+qrE7cHxDzn2BdPzHvT+GRg9vzu9wSFkk+YLXfufwf0MS9y+9sOQQLXnXnS+exn+
         YSQM7glI+7fxz2GC2m9dfG3FhGnKf0kTXdVTnPj7NdCFNKENGjJ3js4PKHJpG7c5DPNH
         v8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719782026; x=1720386826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWboog+rqvm9Ox6aVkr8ZlT55isuINvZAP74QVmennY=;
        b=QBcDW1lAQ0SIdMxtmbxGucJ/dtDqMZv8vl0Vhl1WE+Z5KAmp+BGB7c9psV7wkf8j+6
         b5UwxPHrbxP+mqLie6ysmXXG035Z1t4jgdsf60oWfiyMxeBUBRqJ86547uHNBaSZijHi
         1byOYAQteCxqlDA+2ow/DrKBxYz7i6y0+P7QUkpiWnVRe78X8FqZ8rWZ4TLNF5Ymczm3
         vgT3YjsYE2Bl8la8n4CQ39OuCmu/gz9qx1bKtB4kHzZeEFgc9PwL6W54B4aqKD+1Ssmh
         xSK4DH2jbUwuV+vNxW9kQm4a0TzXV7WvhIpJ+BN9Gr1DJM6E5ODlOZg+M7tWJ3yQbN6g
         Y1fA==
X-Forwarded-Encrypted: i=1; AJvYcCVPhG6zx2YvlgpMCIWNELkU/OG+SddKntdm6ur4XLGVlQmFndr/buL5pvO+3XXKqc8HpYr/wo2BUsvBFSQrqgzCSuF8EW30myehlSc=
X-Gm-Message-State: AOJu0Yw8vQxgk43b9N2+L1DQpdfegHc0pryovrZ4n45l4C/2g1g3vb2J
	XDxzfJ8FAQ+zjzV6XTMSAWS6D70ZJunfa42psBLGOrJHw9Fim5BA
X-Google-Smtp-Source: AGHT+IEAORVQLS8cR6dbwN7ffYUcCD5We/uJF3ts8HFuUIw4j+xA3za4nZQWDIJsz/TIawY3K6lm1w==
X-Received: by 2002:a17:902:ec88:b0:1fa:ab25:f634 with SMTP id d9443c01a7336-1fadbd13592mr49994765ad.3.1719782026060;
        Sun, 30 Jun 2024 14:13:46 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72d8e3f0e11sm3918263a12.87.2024.06.30.14.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 14:13:45 -0700 (PDT)
Date: Mon, 1 Jul 2024 05:13:42 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: rafael@kernel.org
Cc: lenb@kernel.org, mario.limonciello@amd.com, akpm@linux-foundation.org,
	jserv@ccns.ncku.edu.tw, alexdeucher@gmail.com, belegdol@gmail.com,
	linux-acpi@vger.kernel.org, regressions@lists.linux.dev,
	regressions@leemhuis.info, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ACPI: processor_idle: Fix invalid comparison with
 insertion sort for latency
Message-ID: <ZoHKhr9896+Kf65F@visitorckw-System-Product-Name>
References: <c6f4cca2-9258-4dc9-8d4e-96ab7c587783@leemhuis.info>
 <20240630210809.37550-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240630210809.37550-1-visitorckw@gmail.com>

+ linux-kernel@vger.kernel.org

On Mon, Jul 01, 2024 at 05:08:09AM +0800, Kuan-Wei Chiu wrote:
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
> Reported-by: Julian Sikorski <belegdol@gmail.com>
> Closes: https://lore.kernel.org/lkml/70674dc7-5586-4183-8953-8095567e73df@gmail.com/
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> I do not have the appropriate AMD hardware to reproduce this issue and
> test the patch. However, if the aforementioned reason is indeed the
> source of the problem, I believe this patch might help.
> 
>  drivers/acpi/processor_idle.c | 33 ++++++++++++---------------------
>  1 file changed, 12 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
> index bd6a7857ce05..d58a7c64d80b 100644
> --- a/drivers/acpi/processor_idle.c
> +++ b/drivers/acpi/processor_idle.c
> @@ -386,25 +386,19 @@ static void acpi_processor_power_verify_c3(struct acpi_processor *pr,
>  	acpi_write_bit_register(ACPI_BITREG_BUS_MASTER_RLD, 1);
>  }
>  
> -static int acpi_cst_latency_cmp(const void *a, const void *b)
> +static void acpi_cst_latency_sort(struct acpi_processor_cx *arr, size_t length)
>  {
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
> -
> -	if (!(x->valid && y->valid))
> -		return;
> -	swap(x->latency, y->latency);
> +	for (i = 1; i < length; i++) {
> +		for (j = i - 1, k = i; j >= 0; j--) {
> +			if (!arr[j].valid)
> +				continue;
> +			if (arr[j].latency > arr[k].latency)
> +				swap(arr[j].latency, arr[k].latency);
> +			k = j;
> +		}
> +	}
>  }
>  
>  static int acpi_processor_power_verify(struct acpi_processor *pr)
> @@ -449,10 +443,7 @@ static int acpi_processor_power_verify(struct acpi_processor *pr)
>  
>  	if (buggy_latency) {
>  		pr_notice("FW issue: working around C-state latencies out of order\n");
> -		sort(&pr->power.states[1], max_cstate,
> -		     sizeof(struct acpi_processor_cx),
> -		     acpi_cst_latency_cmp,
> -		     acpi_cst_latency_swap);
> +		acpi_cst_latency_sort(&pr->power.states[1], max_cstate);
>  	}
>  
>  	lapic_timer_propagate_broadcast(pr);
> -- 
> 2.34.1
> 
