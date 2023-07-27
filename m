Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB1127150
	for <regressions@lists.linux.dev>; Thu, 27 Jul 2023 17:45:34 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4036bd4fff1so26981cf.0
        for <regressions@lists.linux.dev>; Thu, 27 Jul 2023 10:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690479933; x=1691084733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NM68tAoXkNSSuTEH5H5vU3+nDfBfd+jxzhQH9vzkrQ=;
        b=TSwqBZ8n7ZEGiMAKIfH38i1gT8PJgCeByl6DHc9FRCkEe3M9IJpRif13ZASvuveFBL
         MgYAwesAntN/aPqFJNWVSj4yeIRxUpytPOmO0/5p1QOUytMWZ+1/5ev07X0IvQFCRFnp
         j9PmpZ3vBnTcP2lC5eRx5TaRhTZ86c/oO0By8T5W3Ld/HRAFNgJ7CH1JOvFjQscKwa7y
         eATldlKSZmoIzicr4G9+D/lXK57D+uQ9EmMqG9GGjXByIaxGBH5QqRFVYiW9Lng2dvfL
         LmvGfxZE1GRZhT6ZXEyU30YyPrFgAo+pZiiayJWzPEHaTXOG5k9M3strRyFE7EtY3s87
         gDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690479933; x=1691084733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NM68tAoXkNSSuTEH5H5vU3+nDfBfd+jxzhQH9vzkrQ=;
        b=GjaTFDuZXNHiuudIALZbORjJc7ueIYGB9DGKsPJR52wLGfNBcMEoSFSgXsDr8/AGdr
         kiVczW7HiqlKn7Xdbiv/U63vFZYyrEUN43T5vzhD0GuZyM7o48UmP9J8VFc2ogQKzj0T
         dChjdV1jPlAoTTTTPbX1WqRjwySFlYfXyoRqfIm12IK1LUhqvvGKahSg5ygzbSH9xNEV
         dd4EeMVEkke461K7c94XWcpVrAnopQcmgfFiW06tIC8WEirlnle3pW6l2PzuhstACP76
         eLeXt1hZ6rrAtWbdG31o0LSfb7j8UU9Fxatvjg/yaNF5pUNGd6k3kgfyW2SBjzTz6Wkf
         y7TQ==
X-Gm-Message-State: ABy/qLZMwLeCibg9OZq357eHo66GssiyirKiJxzC+ouFSCt8MfO9E/mU
	LXZmtJeZ397veHJuQEfsXlm97OuTtx1tg1YVOYGwWg==
X-Google-Smtp-Source: APBJJlEj99lMMoNxLZYWPy675+FZqbeUxnuFQ5LbxIpF25s2aVsttkmdEpXKABFsgTiM3g7ONrVYArcNmSfFZO29G3c=
X-Received: by 2002:a05:622a:174d:b0:403:a43d:be41 with SMTP id
 l13-20020a05622a174d00b00403a43dbe41mr19549qtk.20.1690479933375; Thu, 27 Jul
 2023 10:45:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230628082337.1857302-1-georgmueller@gmx.net> <20230628082337.1857302-2-georgmueller@gmx.net>
In-Reply-To: <20230628082337.1857302-2-georgmueller@gmx.net>
From: Ian Rogers <irogers@google.com>
Date: Thu, 27 Jul 2023 10:45:21 -0700
Message-ID: <CAP-5=fUP6UuLgRty3t2=fQsQi3k4hDMz415vWdp1x88QMvZ8ug@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] perf probe: add test for regression introduced by
 switch to die_get_decl_file
To: =?UTF-8?Q?Georg_M=C3=BCller?= <georgmueller@gmx.net>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, regressions@lists.linux.dev, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2023 at 1:25=E2=80=AFAM Georg M=C3=BCller <georgmueller@gmx=
.net> wrote:
>
> This patch adds a test to validate that perf probe works for binaries
> where DWARF info is split into multiple CUs
>
> Signed-off-by: Georg M=C3=BCller <georgmueller@gmx.net>
> Link: https://lore.kernel.org/r/5a00d5a5-7be7-ef8a-4044-9a16249fff25@gmx.=
net/
> ---
>  .../shell/test_uprobe_from_different_cu.sh    | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100755 tools/perf/tests/shell/test_uprobe_from_different_cu.=
sh
>
> diff --git a/tools/perf/tests/shell/test_uprobe_from_different_cu.sh b/to=
ols/perf/tests/shell/test_uprobe_from_different_cu.sh
> new file mode 100755
> index 000000000000..00d2e0e2e0c2
> --- /dev/null
> +++ b/tools/perf/tests/shell/test_uprobe_from_different_cu.sh
> @@ -0,0 +1,77 @@
> +#!/bin/bash
> +# test perf probe of function from different CU
> +# SPDX-License-Identifier: GPL-2.0
> +
> +set -e
> +
> +temp_dir=3D$(mktemp -d /tmp/perf-uprobe-different-cu-sh.XXXXXXXXXX)
> +
> +cleanup()
> +{
> +       trap - EXIT TERM INT
> +       if [[ "${temp_dir}" =3D~ ^/tmp/perf-uprobe-different-cu-sh.*$ ]];=
 then
> +               echo "--- Cleaning up ---"
> +               perf probe -x ${temp_dir}/testfile -d foo
> +               rm -f "${temp_dir}/"*
> +               rmdir "${temp_dir}"
> +       fi
> +}
> +
> +trap_cleanup()
> +{
> +        cleanup
> +        exit 1
> +}
> +
> +trap trap_cleanup EXIT TERM INT
> +
> +cat > ${temp_dir}/testfile-foo.h << EOF
> +struct t
> +{
> +  int *p;
> +  int c;
> +};
> +
> +extern int foo (int i, struct t *t);
> +EOF
> +
> +cat > ${temp_dir}/testfile-foo.c << EOF
> +#include "testfile-foo.h"
> +
> +int
> +foo (int i, struct t *t)
> +{
> +  int j, res =3D 0;
> +  for (j =3D 0; j < i && j < t->c; j++)
> +    res +=3D t->p[j];
> +
> +  return res;
> +}
> +EOF
> +
> +cat > ${temp_dir}/testfile-main.c << EOF
> +#include "testfile-foo.h"
> +
> +static struct t g;
> +
> +int
> +main (int argc, char **argv)
> +{
> +  int i;
> +  int j[argc];
> +  g.c =3D argc;
> +  g.p =3D j;
> +  for (i =3D 0; i < argc; i++)
> +    j[i] =3D (int) argv[i][0];
> +  return foo (3, &g);
> +}
> +EOF
> +
> +gcc -g -Og -flto -c ${temp_dir}/testfile-foo.c -o ${temp_dir}/testfile-f=
oo.o
> +gcc -g -Og -c ${temp_dir}/testfile-main.c -o ${temp_dir}/testfile-main.o
> +gcc -g -Og -o ${temp_dir}/testfile ${temp_dir}/testfile-foo.o ${temp_dir=
}/testfile-main.o

Thanks for the test Georg! By directly relying on gcc this test fails
for me in some constrained environments, like containers. I think
there should be a skip if gcc isn't present. A different option is to
just build the test code into the perf binary itself as a test
workload:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/tests/workloads?h=3Dperf-tools-next

Wdyt? Thanks,
Ian

> +
> +perf probe -x ${temp_dir}/testfile --funcs foo
> +perf probe -x ${temp_dir}/testfile foo
> +
> +cleanup
> --
> 2.41.0
>
