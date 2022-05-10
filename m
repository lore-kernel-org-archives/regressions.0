Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6BB28E9
	for <regressions@lists.linux.dev>; Tue, 10 May 2022 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652193672; x=1683729672;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=N8drDJX7EjyPxyYIr/6B3eFepmHr9YPwLFJHcd7Dioo=;
  b=IP6+fYSltDdzfS5she3cjMpY6/E2rPdYC7PaErwOxfsTxv1FmrjCQycL
   conx2aFdfZWOkAPHTF/gGUOG9GS+JZDp1LSe6eEn0+cjWryz0XAZ4WhBK
   jwOES1ChPPGEj/Kn9XG5Hzfsm6CuppWj3Q/TgiXrZip4NDd2phEKYkCsy
   DrgNIfoyrOWe4lzhrbAu+dW7mUX6uC8zYYnX6jQQbNsnbDcraD6SfXGqZ
   4IhFPb2Q5E9fe8GKyQ/7OJaxayCx7lzBs5ZTDXc7Zp/9q12ktyQ+6KYyx
   R4gpe1VOdlHyt0/RDkaO1xjNMaavbfnEyIhdZe3SVaAMfu+2VtBPfhThA
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="329990274"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="329990274"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 07:41:11 -0700
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="565671977"
Received: from fangy-mobl.ger.corp.intel.com (HELO [10.252.50.83]) ([10.252.50.83])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 07:41:09 -0700
Message-ID: <12bebc80-b792-5739-0d9d-ef1466a9b2aa@linux.intel.com>
Date: Tue, 10 May 2022 16:41:00 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Subject: Re: Linux regressions report for mainline [2022-05-09] (was: Linux
 5.18-rc6)
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CAHk-=wi0vqZQUAS67tBsJQW+dtt89m+dqA-Z4bOs8CH-mm8u2w@mail.gmail.com>
 <165209064657.193515.10163777181547077546@leemhuis.info>
 <CAHk-=wj0gHsG6iw3D8ufptm9a_dvTSqrrOFY9WopObbYbyuwnA@mail.gmail.com>
 <54664f6a-b046-1330-e794-cb533e942a94@redhat.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <54664f6a-b046-1330-e794-cb533e942a94@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Op 09-05-2022 om 21:04 schreef Hans de Goede:
> Hi,
>
> On 5/9/22 19:20, Linus Torvalds wrote:
>> On Mon, May 9, 2022 at 3:47 AM Regzbot (on behalf of Thorsten
>> Leemhuis) <regressions@leemhuis.info> wrote:
>>> Hi Linus! Here's a quick compilation of open reports about regressions in
>>> 5.18-rc that I'm currently aware of; most of the reports are quite
>>> recent and there afaics is nothing that looks particularly worrisome.
>> Well, the Intel GPU issue seems likely to cause problems for lots of people:
>>
>>> [ *NEW* ] drm/i915: BYT rendering broken due to "Remove short-term pins from execbuf, v6"
>>> -----------------------------------------------------------------------------------------
>>> https://linux-regtracking.leemhuis.info/regzbot/regression/1366349e-f96a-3f2c-3094-f5cd1a6fa31f@redhat.com/
>>> https://lore.kernel.org/dri-devel/1366349e-f96a-3f2c-3094-f5cd1a6fa31f@redhat.com/
>>>
>>> By Hans de Goede; 0 days ago; 2 activities, latest 0 days ago.
>>> Introduced in b5cfe6f7a6e1 (v5.18-rc1)
>>>
>>> Recent activities from: Tvrtko Ursulin (1), Hans de Goede (1)
>> Although it looks possible that it mainly affects old chipsets (ie the
>> two reports are for a Bay Trail chip and a Core 2 Duo chip - I have no
>> idea how they compare).
>>
>> That probably means there are a lot of machines out there, but likely
>> not the kind that most kernel developers will be testing, so not a ton
>> of reports until it hits distro kernels etc.
>>
>> It looks like Maarten is already involved.
> This is being tracked here:
> https://gitlab.freedesktop.org/drm/intel/-/issues/5806
>
> I've just tested a patch from Maarten which fixes things for me,
> so hopefully we can get this resolved soon.
>
> Regards,
>
> Hans
>
Hey,

I'm still waiting on feedback on the last patch there, can you test it?

That should be the real fix most likely, waiting for binding to complete before using the vma.

~Maarten

