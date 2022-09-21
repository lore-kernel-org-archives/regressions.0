Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEC93D86
	for <regressions@lists.linux.dev>; Wed, 21 Sep 2022 14:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663769709; x=1695305709;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kV8SvwzQDpNaPqI8Ad9CXg1aOsjOIFy6gAewf2bsPso=;
  b=gdUw8sZLEtU6DNmYILEh7MxQoCsP8LvB8X80jz6Hc4Tx8hhmhIogVjfu
   QgBBffKP7GjFEQup5WN/eqDvOBy4KqvDWZANbV2nm/lpsJuYP+lfC5M96
   F43sumnDCAkJ8sxXwZ1fKDDin+pKtx7Xe1LYCQDxNArH3lYHy5RqC7s0S
   zepxZAnHKNViktvghApQsoDfdHdFZmwFoYTuCY8bMQZvTz9pZZ88hECaF
   OaLhy7WQGMc3M05Zyz1+g7n27bBPVgUndqrPP0LOq36DgNH11qn0QLaza
   7KN+8GUd0DZ5sJHjgL1GaYgpIbTFCqWdNf+3mldnKZSx9yaJeBGMmRXYz
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="300852500"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="300852500"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 07:15:09 -0700
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="687890947"
Received: from ryero-mobl.amr.corp.intel.com (HELO [10.209.89.231]) ([10.209.89.231])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 07:15:07 -0700
Message-ID: <2b6143b6-9db4-05bc-1e8d-c5d129126f99@intel.com>
Date: Wed, 21 Sep 2022 07:15:07 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ACPI: processor_idle: Skip dummy wait for processors
 based on the Zen microarchitecture
Content-Language: en-US
To: K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, dave.hansen@linux.intel.com, bp@alien8.de,
 tglx@linutronix.de, andi@lisas.de, puwen@hygon.cn,
 mario.limonciello@amd.com, peterz@infradead.org, rui.zhang@intel.com,
 gpiccoli@igalia.com, daniel.lezcano@linaro.org, ananth.narayan@amd.com,
 gautham.shenoy@amd.com, Calvin Ong <calvin.ong@amd.com>,
 stable@vger.kernel.org, regressions@lists.linux.dev
References: <20220921063638.2489-1-kprateek.nayak@amd.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20220921063638.2489-1-kprateek.nayak@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/20/22 23:36, K Prateek Nayak wrote:
> +	/*
> +	 * No delay is needed if we are in guest or on a processor
> +	 * based on the Zen microarchitecture.
> +	 */
> +	if (boot_cpu_has(X86_FEATURE_HYPERVISOR) || boot_cpu_has(X86_FEATURE_ZEN))
>  		return;

In the end, the delay is because of buggy, circa 2006 chipsets?  So, we
use a CPU vendor specific check to approximate that the chipset is
recent and not affected by the bug?  If so, is there no better way to
check for a newer chipset than this?

Do X86_FEATURE_ZEN CPUs just have unusually painful
inl(acpi_fadt.xpm_tmr_blk.address) implementations?  Is that why we
noticed all of a sudden?

