Received: from nibbler.cm4all.net (nibbler.cm4all.net [82.165.145.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2FD2590
	for <regressions@lists.linux.dev>; Sat, 16 Apr 2022 20:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by nibbler.cm4all.net (Postfix) with ESMTP id DC737C00F4
	for <regressions@lists.linux.dev>; Sat, 16 Apr 2022 21:56:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at nibbler.cm4all.net
Received: from nibbler.cm4all.net ([127.0.0.1])
	by localhost (nibbler.cm4all.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id E0uuTvB1BNir for <regressions@lists.linux.dev>;
	Sat, 16 Apr 2022 21:55:54 +0200 (CEST)
Received: from zero.intern.cm-ag (zero.intern.cm-ag [172.30.16.10])
	by nibbler.cm4all.net (Postfix) with SMTP id BC916C00CB
	for <regressions@lists.linux.dev>; Sat, 16 Apr 2022 21:55:54 +0200 (CEST)
Received: (qmail 4335 invoked from network); 17 Apr 2022 01:45:20 +0200
Received: from unknown (HELO rabbit.intern.cm-ag) (172.30.3.1)
  by zero.intern.cm-ag with SMTP; 17 Apr 2022 01:45:20 +0200
Received: by rabbit.intern.cm-ag (Postfix, from userid 1023)
	id 86426460E36; Sat, 16 Apr 2022 21:55:54 +0200 (CEST)
Date: Sat, 16 Apr 2022 21:55:54 +0200
From: Max Kellermann <mk@cm4all.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Max Kellermann <mk@cm4all.com>, dhowells@redhat.com,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: fscache corruption in Linux 5.17?
Message-ID: <YlsfSqysfKJqwDVz@rabbit.intern.cm-ag>
References: <YlWWbpW5Foynjllo@rabbit.intern.cm-ag>
 <c6b80014-846d-cd90-7e67-d72959ffabe1@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6b80014-846d-cd90-7e67-d72959ffabe1@leemhuis.info>

On 2022/04/16 13:38, Thorsten Leemhuis <regressions@leemhuis.info> wrote:
> Thx for the report. Maybe a bisection is what's needed here, but lets
> see what David says, maybe he has a idea already.

I wish I could do that, but it's very hard to reproduce; the first
reports came after a week or so.  That way, a bisect would take
months.  So yes, wait for David, because he might give a clue how to
trigger the problem more quickly to make a bisect practical.
