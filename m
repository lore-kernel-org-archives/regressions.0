Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AD17C
	for <regressions@lists.linux.dev>; Thu, 22 Sep 2022 16:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663865085; x=1695401085;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4uE7sNidb9Paf5GPXLz1sBYwKBlJQu6D2h8Uty+X/i4=;
  b=jDdvhHkc0pAfJfuJ65xk/JisdibVo/xwx03LdVuZQZD8PDhrXLe3x8UI
   ipo+KEBUUriuN9iAlB07kmyTSByTYGDDy32jSr3r+13QBc87eheLbcs7e
   k2S9fL0KQNslxwRmw/s0lagzOSU2u0GL5AvR2i0lV09/1Okb6etrog2kU
   WRe67Qirc147hpszzcaQZuH/5PSYhgkHD5A4cZgs7ncfv33SQKcjZe23r
   mjXHnrLIYHJdBkpwsgC0Vwq0e3cT/PhD9210LrwiluApDzZ3zKvi4+C5K
   v6zIfMV8TzAg4RzQS8fNHLxzA0qvM1eN2052FxG7D2x4+4caQmLCUdxNn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="300341425"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="300341425"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 09:44:44 -0700
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="682292605"
Received: from sponnura-mobl1.amr.corp.intel.com (HELO [10.209.58.200]) ([10.209.58.200])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 09:44:43 -0700
Message-ID: <20e78a49-25df-c83d-842e-1d624655cfd7@intel.com>
Date: Thu, 22 Sep 2022 09:44:43 -0700
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
> Cc: stable@vger.kernel.org
> Cc: regressions@lists.linux.dev

*Is* this a regression?
