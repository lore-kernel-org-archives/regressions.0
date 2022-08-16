Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2D31C32
	for <regressions@lists.linux.dev>; Tue, 16 Aug 2022 05:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660626179;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SP+U2Pc7sWzJAq0KCIIR4ULIjV8K9utWLV+ekyPPst4=;
	b=Y0niHYcV108o4S7+64JXf9hnt6lSQdeZGYWyNg3WLelscxhi0YbPGFDB2ZnqNT5iFrIrEm
	gWicT0Yhk+0J7+RU01Ua1RfK7FrRLQG5PQl9XcOE7HX8qi1DGnYeCFlaljOZeLLgepgAVn
	Q3r2fwljuDL9mpuCY4c2JWvWJDG5teM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-f1FMmC6VMI2CgsYY_HYbQA-1; Tue, 16 Aug 2022 01:02:53 -0400
X-MC-Unique: f1FMmC6VMI2CgsYY_HYbQA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 526981C01B2B;
	Tue, 16 Aug 2022 05:02:53 +0000 (UTC)
Received: from [10.64.54.77] (vpn2-54-77.bne.redhat.com [10.64.54.77])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39C27141512E;
	Tue, 16 Aug 2022 05:02:48 +0000 (UTC)
Reply-To: Gavin Shan <gshan@redhat.com>
Subject: Re: [KVM] e923b0537d: kernel-selftests.kvm.rseq_test.fail
To: Sean Christopherson <seanjc@google.com>,
 kernel test robot <oliver.sang@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Oliver Upton
 <oliver.upton@linux.dev>, Andrew Jones <andrew.jones@linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org, lkp@lists.01.org,
 lkp@intel.com, xudong.hao@intel.com, regressions@lists.linux.dev
References: <Yvn60W/JpPO8URLY@xsang-OptiPlex-9020>
 <Yvq9wzXNF4ZnlCdk@google.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <5034abb9-e176-d480-c577-1ec5dd47182b@redhat.com>
Date: Tue, 16 Aug 2022 15:02:46 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Yvq9wzXNF4ZnlCdk@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7

Hi Sean,

On 8/16/22 7:42 AM, Sean Christopherson wrote:
> On Mon, Aug 15, 2022, kernel test robot wrote:
>> commit: e923b0537d28e15c9d31ce8b38f810b325816903 ("KVM: selftests: Fix target thread to be migrated in rseq_test")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> ...
> 
>> # selftests: kvm: rseq_test
>> # ==== Test Assertion Failure ====
>> #   rseq_test.c:278: i > (NR_TASK_MIGRATIONS / 2)
>> #   pid=49599 tid=49599 errno=4 - Interrupted system call
>> #      1	0x000000000040265d: main at rseq_test.c:278
>> #      2	0x00007fe44eed07fc: ?? ??:0
>> #      3	0x00000000004026d9: _start at ??:?
>> #   Only performed 23174 KVM_RUNs, task stalled too much?
>> #
>> not ok 56 selftests: kvm: rseq_test # exit=254
> 
> ...
> 
>> # Automatically generated file; DO NOT EDIT.
>> # Linux/x86_64 5.19.0-rc6 Kernel Configuration
>> #
>> CONFIG_CC_VERSION_TEXT="gcc-11 (Debian 11.3.0-3) 11.3.0"
>> CONFIG_CC_IS_GCC=y
>> CONFIG_GCC_VERSION=110300
>> CONFIG_CLANG_VERSION=0
>> CONFIG_AS_IS_GNU=y
>> CONFIG_AS_VERSION=23800
>> CONFIG_LD_IS_BFD=y
>> CONFIG_LD_VERSION=23800
>> CONFIG_LLD_VERSION=0
> 
> Assuming 23800 == 2.38, this is a known issue.
> 
> https://lore.kernel.org/all/20220810104114.6838-1-gshan@redhat.com
> 

It's probably different story this time. The assert is triggered because
of the following instructions. I would guess the reason is vcpu thread
has been running on CPU where we has high CPU load. In this case, the
vcpu thread can't be run in time. More specific, the vcpu thread can't
be run in the 1 - 10us time window, which is specified by the migration
worker (thread).

     TEST_ASSERT(i > (NR_TASK_MIGRATIONS / 2),
                 "Only performed %d KVM_RUNs, task stalled too much?\n", i);

I think we need to improve the handshake mechanism between the vcpu thread
and migration worker. In current implementation, the handshake is done through
the atomic counter. The mechanism is simple enough, but vcpu thread can miss
the aforementioned time window. Another issue is the test case much more time
than expected to finish.

Sean, if you think it's reasonable, I can figure out something to do:

- Reuse the atomic counter for a full synchronization between these two
   threads. Something like below:

   #define RSEQ_TEST_STATE_RUN_VCPU       0     // vcpu_run()
   #define RSEQ_TEST_STATE_MIGRATE        1     // sched_setaffinity()
   #define RSEQ_TEST_STATE_CHECK          2     // Check rseq.cpu_id and get_cpu()

   The atomic counter is reset to RSEQ_TEST_STATE_RUN_VCPU after RSEQ_TEST_STATE_RUN_VCPU

- Reduce NR_TASK_MIGRATIONS from 100000 to num_of_online_cpus(). With this,
   less time is needed to finish the test case.

Thanks,
Gavin

   


