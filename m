Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718644;
	b=M/JhQ3yoIihKrHFX+lOKeAJv83G/QdqQuuOS0k0EiviFUTNr/U/1RGjH5SoBlGW4ewOH
	 DheKd9yjZsEaA8zVrjQUmwnGH6VJrzL2i+qs7biLTIlZFyEZGwn8c+TUDGwMk7Z7baqEs
	 MZlgNuSAIab/RNIVTQysxYh+bB1G1qEUNc8rdOsEOKG0lZDdKQ4Fbj/Cm8/u2Ud6G/YIO
	 CMmCx0rO+ayoJeQ2uPitu6jVUlfS87biiXjttwLTffVdF1a6A2MTO3pIUl3j23p/g6yyA
	 XJL/IYYAnlr3B96II29jn7qzdwirY+qL1hhEedAGF4sFtSJgzd8pjpLUfleF0Wupmkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718644;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Stat-Signature:
	 X-Spam-Status:X-Rspamd-Server:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=ESkAEuuc6yy51dqWmu+sKhO9bwkMv1/8Gydhfy53QWQ=;
	b=vEGoA1ynol2jq7YjUFXQPVk+oPvAvZraE3Sqc1ftv1Pgizwt6slkKhgU4MGdKNpbqfqG
	 l12ONBaLMOKraqDb96TMM1HE07YGb10W1nAEGXK7L2nAJud+VfDHfld00MGdGqMjWPX/R
	 81/Qh+fyqqLIHjjedXLxvDb9S9A9WkrlyExyklJSi2rpBXT9qG5Fv+m8ARyeUICc1wsEE
	 zR2xqQyNKOcV899W2Xu0Mg4QjY3TvY4w/dAiJqNjHqHx27PiK0q5Cr/Klfg6+v4oWtKy+
	 GZqUwc7+f//9nl5SiiR/VemXdshdkvh+eHRig64iPQP6P1BhI3ZaiTh4CqYkXyUO2Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=vgIXlRYX;
	arc=none smtp.remote-ip=216.40.44.12
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1673C606D2E4
	for <regressions@lists.linux.dev>; Tue,  3 Nov 2026 15:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1673C606D2E4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=vgIXlRYX
Received: from omf18.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id BB1FFA047C;
	Tue,  3 Nov 2026 15:10:39 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id 80A5B30;
	Tue,  3 Nov 2026 15:10:35 +0000 (UTC)
Date: Tue, 3 Nov 2026 10:10:34 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Paolo Bertinetti <paolobertinetti200f4@proton.me>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian
 Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James
 Clark <james.clark@linaro.org>, Kan Liang <kan.liang@linux.intel.com>, Leo
 Yan <leo.yan@arm.com>, Francesco Nigro <nigro.fra@gmail.com>, Sumanth
 Korikkar <sumanthk@linux.ibm.com>, linux-perf-users@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [PATCH 0/2] perf: Fix PERF_EVENT_IOC_REFRESH for tracepoints
 and breakpoints
Message-ID: <20261103101034.75f5bb0f@gandalf.local.home>
In-Reply-To: <20261103131138.765683-1-paolobertinetti200f4@proton.me>
References: <20261103131138.765683-1-paolobertinetti200f4@proton.me>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 80A5B30
X-Stat-Signature: u1mhwxim99k5uhjipj1oif11qk1hhbbm
X-Rspamd-Server: rspamout08
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/lxSyrX1gU2HgudnYaeKf4tSHeqyO5JcE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=ESkAEuuc6yy51dqWmu+sKhO9bwkMv1/8Gydhfy53QWQ=; b=vgIXlRYXqd26A4OEK4CWvjySd7mR6lI47OqAj87iJoNj70UOViW1elyhCSjbgQQnEO1CuspSC+iHNvDmcmJRzm5HSh3fwxB0vGIT7HwuToBu+KPox/tKzHpjrELtSR9+vthP8XlPmWE23fYkTTjcrZ1PIdNkKCbMjEyg0Ln3r0M=
X-HE-Tag: 1793718635-427110
X-HE-Meta: U2FsdGVkX18rKnbTyAE96elUkva/DyDa9fDxY7tpAh+us0eWVDzJjLuxGjRVgLMUvOr+Q/i5hSU6zMPLOQXf1Vxw46bdrSPgXIWjS6SI0MVjJAu6U2yQewrYzIOr8nDavVBYKXhNBSBWvR9jtpr7NbYgpK2/tkE2HUIQIYHtEaR2cLT1OnoR8EB2/gtCXHVo2jq9i9B4m7q3rsJDMDBdi2BDE5xUNppHfFx6wdtasXMZZPBmL4wY8BTpn+ZjKFG1vfFT5vQGQHKUAqa0nMrXREBjuFQ2J/MkYBDCl5+swRuuizqwPgV2Xmve1P1JUGUlUQm2oeawvLDC6ohtV7DvBkIjgFDUGOr+X3tuOI8wxkJMJlarIKwLzQ==

On Tue, 03 Nov 2026 13:11:41 +0000
Paolo Bertinetti <paolobertinetti200f4@proton.me> wrote:

> This series went out twice by mistake. Please ignore this copy and
> reply to the first one:
> 
> https://lore.kernel.org/r/20261103130732.764081-1-paolobertinetti200f4@proton.me/
> 
> Sorry for the noise.

Yet this one has the cover letter whereas the other one does not :-/

-- Steve

