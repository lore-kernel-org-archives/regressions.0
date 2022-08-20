Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09862F29
	for <regressions@lists.linux.dev>; Sat, 20 Aug 2022 15:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661009383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9eDytxqOFXATcuaC2QjIlSYBaETDtOjAP11zj+1dFhI=;
	b=bA1khCRwTYpSW4JKlsBJ2fHi2OS4Ny0R5mDoAjHfFdkSKUoFhzYizbu3fBr59VCQeGrbqW
	lMnLNboY5RQe4wPAAzXJTne/ErvYuYZRusf+JxSBYFifJR70oGNyjIQ2iMdrGU2xFQ4KpQ
	Rglh7JYTI1+cJ2E37L2lHOl0cjGp8KA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-437-7XftQuBFPqmHUr1rF2Jqxg-1; Sat, 20 Aug 2022 11:29:42 -0400
X-MC-Unique: 7XftQuBFPqmHUr1rF2Jqxg-1
Received: by mail-ed1-f70.google.com with SMTP id o2-20020a056402438200b0043d552deb2aso4363300edc.0
        for <regressions@lists.linux.dev>; Sat, 20 Aug 2022 08:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=9eDytxqOFXATcuaC2QjIlSYBaETDtOjAP11zj+1dFhI=;
        b=mv4OxqY3lDy6PgwJMEvHOIn/UQEsYrN6WHa2PeIcP5lTl7zBO0o2Wl9QASEPKQoUh2
         p6YHP2wovvycA0x4rsVpKDj3sxNzh4GmNCQ8GGf+hTl6NMu5QIhV6bHQr3a5xaBirDG6
         g9NAx4IpvJUUK5yKWuUcuNyKnQ7CZ7ozd1QYHGtEIN2qtTaAoiVK2dEthvIV/RBywROP
         i3SH76gptZppSqnwvIO18pnCRP8+5qD4pwjblRz+UkF/PLpzhW7wSO+4RsoOrfX4U7td
         8CQzoJxdToptWpHR1UN7juGVrSfNmTwHWK8u0F24PBTitnhScPJZzxQ7nOs6ab/fj68Y
         yOVg==
X-Gm-Message-State: ACgBeo3F2B8WvWUAxqH83iHBG7N3nYELg7A5hQ2WlWQNGJdLjz3OzW1X
	ml8a7XvP7V8INt55H7nq8h2zlt4DoopfaSi8hMEUTDIRAc+ffBCxqrlPoMP5ftc6+O3fMLiOZUc
	bHtJc+JJnXhDU3KGzisc1AW0=
X-Received: by 2002:a05:6402:2804:b0:439:83c2:8be2 with SMTP id h4-20020a056402280400b0043983c28be2mr10004405ede.292.1661009381062;
        Sat, 20 Aug 2022 08:29:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4rHIk3sxbzi5q1BvZzHlwlr5FRnZTYFUXNn/hws6YK8dF/QqociNsu2p5wg9Ex5uGhOW6G6w==
X-Received: by 2002:a05:6402:2804:b0:439:83c2:8be2 with SMTP id h4-20020a056402280400b0043983c28be2mr10004399ede.292.1661009380905;
        Sat, 20 Aug 2022 08:29:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id c9-20020a17090618a900b007313a25e56esm3677726ejf.29.2022.08.20.08.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Aug 2022 08:29:40 -0700 (PDT)
Message-ID: <d7ed51da-ddf1-cb43-4932-00ff523cf7b5@redhat.com>
Date: Sat, 20 Aug 2022 17:29:39 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From: Hans de Goede <hdegoede@redhat.com>
Subject: 6.0-rc1 new RCU stall warning/stack trace
To: Mathias Nyman <mathias.nyman@intel.com>,
 linux-usb <linux-usb@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

While dogfooding 6.0-rc1 on my main workstation I noticed the following
new RCU stall warning/stack trace after a suspend/resume:

[  290.653114] xhci_hcd 0000:16:00.0: xHC error in resume, USBSTS 0x401, Reinit
...
[  290.653253] usb usb1: root hub lost power or was reset
[  290.653255] usb usb2: root hub lost power or was reset
...
[  290.684960] rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: { 9-...D } 28 jiffies s: 985 root: 0x1/.
[  290.684972] rcu: blocking rcu_node structures (internal RCU debug): l=1:0-15:0x200/.
[  290.684975] Task dump for CPU 9:
[  290.684977] task:kworker/u64:20  state:R  running task     stack:    0 pid: 3993 ppid:     2 flags:0x00004008
[  290.684982] Workqueue: events_unbound async_run_entry_fn
[  290.684987] Call Trace:
[  290.684988]  <TASK>
[  290.684994]  ? lock_is_held_type+0xe3/0x140
[  290.684999]  ? find_held_lock+0x2b/0x80
[  290.685003]  ? lock_release+0x135/0x2d0
[  290.685008]  ? delay_halt+0x3b/0x60
[  290.685012]  ? xhci_handshake+0x3e/0xb0
[  290.685016]  ? xhci_reset+0x6a/0x100
[  290.685019]  ? xhci_resume+0x1ec/0x600
[  290.685023]  ? resume_common+0xa0/0x100
[  290.685026]  ? pci_pm_poweroff_noirq+0x100/0x100
[  290.685030]  ? dpm_run_callback+0x53/0xc0
[  290.685034]  ? device_resume+0xa8/0x200
[  290.685038]  ? async_resume+0x19/0x30
[  290.685040]  ? async_run_entry_fn+0x30/0x130
[  290.685043]  ? process_one_work+0x257/0x570
[  290.685050]  ? worker_thread+0x4f/0x3a0
[  290.685054]  ? process_one_work+0x570/0x570
[  290.685056]  ? kthread+0xf5/0x120
[  290.685058]  ? kthread_complete_and_exit+0x20/0x20
[  290.685062]  ? ret_from_fork+0x22/0x30
[  290.685072]  </TASK>

Note I've not seen any negative side-effects from this yet,
still I thought it would be good to report this.

Regards,

Hans


