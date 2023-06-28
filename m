Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B665C2D9
	for <regressions@lists.linux.dev>; Wed, 28 Jun 2023 14:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1687964171; x=1688568971; i=markus.elfring@web.de;
 bh=lVrEtp3IPToA2JjQfomOq/78WOmzGlRvhlt4KV8ZwWw=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=qSHH+F+Y/q2y/NGP4HWdV2ZobhNlK2l2zqDz9YjyoJBOwAVsBgjJQT/4NZNWZRy3nxUQs3K
 fPUGIxeWgpG0U1VzRITq/VLllEtw/g8jyOyiANJIiqVjK3Zz/HK6CsaglYDLvMjwL0DL2e9A0
 d50RAZw5iZ9r+xiZgmyDYzyRpaBr5V3b8ULa+B5qrJzOv+5B8gi5j/ozr/k+kOYJN9BUIrKxK
 V7kmrJT5hMc5mujsIH7qS1nXER5JYdqj6j43YE66VhjOn5QmoYmRa/uIBOujlxDwsVd4D4ax7
 NpCaeQ3MkY41aFVf5afY5SCA6knAhDx8Ski0UsqoEQk3CdlDv9vw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N7xaT-1q2Gy43aQl-014beM; Wed, 28
 Jun 2023 16:48:15 +0200
Message-ID: <66d4911b-150a-7c10-7a3a-c4d0019c18fc@web.de>
Date: Wed, 28 Jun 2023 16:48:13 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: =?UTF-8?Q?Georg_M=c3=bcller?= <georgmueller@gmx.net>,
 linux-perf-users@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>,
 Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev
References: <20230628084551.1860532-5-georgmueller@gmx.net>
Subject: Re: [PATCH v3 1/2] perf probe: add test for regression introduced by
 switch to die_get_decl_file
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230628084551.1860532-5-georgmueller@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hLxSikh9iuvu3XDUpSiPu8aHEn+1o4HTLLlN5JonJNiO0GHbZWY
 4qQDQNUkmUrLTeG+elaGab8HuOZ0G70OjVYY2pmmS6WIZ8xvHeSQV/HgNzRxVsfVnBKLtU4
 2BsZ40p3wlwAfyY/BO8UYpgwxQFdbQrcyB36TheVwLNO3nS8SdftXNkFhlv74zk9skq8ErU
 DoaKWWNsxUCWUx7RwebcQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:diwD9OVMKoI=;QFnIC6nITHVtiycSxpv4tHSFI9p
 xzL7MSOEDtJepHYRx52kxuJABQbjw5jcjgkOOBh2pKi3KbTghI/jOcWBBSISjU+tWWEiaZwT3
 otctNawEs4EqvLLdEd9Y+qnF6F4j6SU4dLk1IXd+wku7XQz6lD1G6kBfJ80erAM5Y74n+qiTx
 BU3x19rY8sfYDiUdPh+LB+RgenVGoKBCRuV2gKFl3vl+oNczd3HM4L5uEuT3m686W0WZ8Ais2
 m1iKaWpzZ2PSQlSHqllKgPinUF63Kc7xtaH2QEsvnKFHRRNZhs2sOU3J9IMa7t2sXmdEwdAw+
 OXV7SRnI0vsh1leUlZskgmDTsaFxpnOMJccVcUHYOiCyP27aQLCC3o1Ru+k3IXcNTLQ9zqYhH
 I+cfTzb0vw0SF5sDd42vzel/0rDbJO0n0uyz72aXFpcMSVygfCaoXEH04oJx6woa4JYQuwo1Y
 VsAPcQNPUsJhI/9xh8fcISEp6f3vC2D0R7rJg4FnjIK5PnP4ZESuaqJ3i5EKwTLMFGUjNEQ7f
 6ZLwoyWwU9VS72IlHdSLjn/lxTYmqhsv3MBlwWjLssANeaYWtgis3MJzIdFpmEWnGkqjqyV8D
 8xfyjcMROhJ71t6GNgdm/GrJgkRFn9Uz0Mf1/9ncpPDwPKSDLAoXf1b1TlAJqavvNoQ07aZgC
 fGueRXLj1rXkoMrl+SdC7TvmMpqlIuwNdnGJapDCRv57Hol1Yc0/RZxRdAaqSZ9ecmMDBQse7
 iA1YG43+eJHUGHFdT3V5pI5+4hgcnpyd9cSp881lTTqI6akbur0za5NbDlsuaM3nnNUx0oJOb
 vwq3ofw/qTmArQaPk5iKkrYjRqI2FEzPzsmPzuHw644H67puds1F5tdP5Gc4vwXLJwkRqFQEo
 OBiTwAxj6DSLTzdt2p0eO7vrcDCjFj4mhloCNjefIggQbxycCDd82qRlA63PsUZmYUxDp9ry+
 W7RxvQ==

> This patch adds a test to validate that perf probe works for binaries
=E2=80=A6

Please choose imperative change suggestions.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.4#n94

Regards,
Markus
