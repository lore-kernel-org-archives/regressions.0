Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F4E29AC
	for <regressions@lists.linux.dev>; Fri, 26 Aug 2022 10:13:17 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oRWKx-0005ux-BV; Fri, 26 Aug 2022 12:13:15 +0200
Message-ID: <d0433877-2971-b54d-fcbe-2837ae9248be@leemhuis.info>
Date: Fri, 26 Aug 2022 12:13:13 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 bhealey@live.co.uk
Content-Language: en-US
Subject: [Regression] Bug 216360 - No power to DVD drive
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1661508797;78e87ad3;
X-HE-SMSGID: 1oRWKx-0005ux-BV

Hi Rafael. Could you help me out if you have a minute? I noticed
a regression report in bugzilla that nobody looked at yet. According to
the reporter the DVD drive's drawer of a small form factor system won't
open anymore since v5.16; the device is not even mentioned anymore in
the dmesg output. For details see:

https://bugzilla.kernel.org/show_bug.cgi?id=216360

Is that an ACPI problem and thus something you would handle? If not: in
which direction would you shove this?

Ciao, Thorsten

P.S.: To get this tracked:

#regzbot introduced: v5.15..v5.16
https://bugzilla.kernel.org/show_bug.cgi?id=216360
#regzbot ignore-activity

