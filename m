Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951367C
	for <regressions@lists.linux.dev>; Thu, 22 Sep 2022 16:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663864575; x=1695400575;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XksDpOqRwt44B4iEf3mFYfxR+zBGMcBBxmzTBp9XKR8=;
  b=gD0ug7s4Nr28P++pQyKmHmiK6BGPEQDwBJVw5RI2FCIPofb3CRBOxj7I
   TlJFLaNy6BY7xEt7AOV0kjkj0k7Mbc6DPziMP8Ra8D0mAAeAjtUWyartm
   NTKaS/07/JvK/u0uXjLx2Y/UVG2s4UqI0N5qhm/sDMgwOnnlL+QzeQ9tb
   Gk2HZG7LSY222GRKSjvdIJONTd9hjM15uhGZOU49L3ayk/c+mYdVINKEK
   6sdhYERfGQhSaSFABQKquMMnwMqw6msADpBzpvdO7Kt9zpD2Gs80e0s+j
   Crlv0r+YOQ2mn/ZcpjYlvtTyRbpqOC5BQwVRSzh/hCejBb9C3JCuzOvRA
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280073859"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="280073859"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 09:36:14 -0700
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="615275113"
Received: from sponnura-mobl1.amr.corp.intel.com (HELO [10.209.58.200]) ([10.209.58.200])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 09:36:05 -0700
Message-ID: <f3916119-420b-bfd7-e148-e9dd422813c8@intel.com>
Date: Thu, 22 Sep 2022 09:36:05 -0700
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
To: "Rafael J. Wysocki" <rafael@kernel.org>, Borislav Petkov <bp@alien8.de>
Cc: Peter Zijlstra <peterz@infradead.org>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Len Brown <lenb@kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, andi@lisas.de, Pu Wen
 <puwen@hygon.cn>, Mario Limonciello <mario.limonciello@amd.com>,
 "Zhang, Rui" <rui.zhang@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, ananth.narayan@amd.com,
 gautham.shenoy@amd.com, Calvin Ong <calvin.ong@amd.com>,
 Stable <stable@vger.kernel.org>, regressions@lists.linux.dev
References: <20220921063638.2489-1-kprateek.nayak@amd.com>
 <YysnE8rcZAOOj28A@hirez.programming.kicks-ass.net> <YytqfVUCWfv0XyZO@zn.tnic>
 <YywaAcTdLSuDlRfl@hirez.programming.kicks-ass.net>
 <CAJZ5v0i9P-srVxrSPZOkXhKVCA2vEQqm5B4ZZifS=ivpwv+A-w@mail.gmail.com>
 <YyyA9AV9qiPxmmpb@zn.tnic>
 <CAJZ5v0i0NzJfRuqcuJQC3J5moaEikoRusquCybAz0T8dMy8gCw@mail.gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <CAJZ5v0i0NzJfRuqcuJQC3J5moaEikoRusquCybAz0T8dMy8gCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/22 08:53, Rafael J. Wysocki wrote:
> On Thu, Sep 22, 2022 at 5:36 PM Borislav Petkov <bp@alien8.de> wrote:
>> On Thu, Sep 22, 2022 at 05:21:21PM +0200, Rafael J. Wysocki wrote:
>>> Well, it can be forced to use ACPI idle instead.
>> Yeah, I did that earlier. The dummy IO read in question costs ~3K on
>> average on my Coffeelake box here.
> Well, that's the cost of forcing something non-default.

Just to be clear: The _original_ AMD Zen problem that this thread is
addressing is from a *default* configuration, right?  It isn't that
someone overrode the idle defaults?
